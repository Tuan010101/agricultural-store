package com.example.khoaluan.controller;

import com.example.khoaluan.dto.ProductDto;
import com.example.khoaluan.dto.TableDto;
import com.example.khoaluan.mapper.ProductMapper;
import com.example.khoaluan.model.Account;
import com.example.khoaluan.model.Category;
import com.example.khoaluan.model.Product;
import com.example.khoaluan.model.Tables;
import com.example.khoaluan.repository.productRepository.ProductRepositoryCustom;
import com.example.khoaluan.repository.tablesRepository.TablesRepository;
import com.example.khoaluan.repository.tablesRepository.TablesRepositoryCustom;
import com.example.khoaluan.service.category.CategoryService;
import com.example.khoaluan.service.product.ProductService;
import com.example.khoaluan.service.tables.TablesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;


@Slf4j
@Controller
public class ManagerController {
    @Autowired
    ProductService productService;

    @Autowired
    ProductRepositoryCustom productRepositoryCustom;

    @Autowired
    ProductMapper productMapper;

    @Autowired
    CategoryService categoryService;

    @Autowired
    TablesRepository tablesRepository;

    @Autowired
    TablesRepositoryCustom tablesRepositoryCustom;

    @Autowired
    TablesService tablesService;

    @GetMapping("/products")
    public String Manager(Model model, HttpSession session, @ModelAttribute Product product){

        log.info("product: {}", product);

        Account account = (Account) session.getAttribute("account");
        if(account == null){
            return "redirect:/sign-in";
        }
        if(account.getRole() != 1){
            return "not-have-access";
        }

        String cateId = "";
        if(product.getCateId() != null) {
            cateId = String.valueOf(product.getCateId());
        }
        if(product.getName() != null){
            List<ProductDto> products = productRepositoryCustom.findByNameAndCateId(product.getName(), cateId);
            List<Category> categories = categoryService.findAllCategory();

            String active = "manager";
            model.addAttribute("active", active);
            model.addAttribute("products", products);
            model.addAttribute("categories", categories);
            return "manager";
        }

        List<ProductDto> products = productRepositoryCustom.getListProductDto();
        List<Category> categories = categoryService.findAllCategory();

        String active = "manager";
        model.addAttribute("active", active);
        model.addAttribute("products", products);
        model.addAttribute("categories", categories);
        return "manager";
    }

    @PostMapping("/products")
    public String CreateProduct(Model model,
                                @RequestParam("name") String name,
                                @RequestParam("category") Long category,
                                @RequestParam("image") String image,
                                @RequestParam("description") String description,
                                @RequestParam("price") Double price){
        log.info("save product");
        Product product = new Product();
        product.setName(name);
        product.setCateId(category);
        product.setImage(image);
        product.setDescription(description);
        product.setPrice(price);
        product.setSellId((long) 1);
        productService.saveProduct(product);

        //productService.saveProduct(product);
        String active = "manager";
        model.addAttribute("active", active);
        return "redirect:/products?status=insert_success";
    }

    @PostMapping("/products/update/{id}")
    public String updateProduct(Model model, @ModelAttribute ProductDto productDto, @PathVariable Long id){

        log.info("productId update: {}", id);

        Category category = categoryService.findByNameOfCategory(productDto.getNameOfCategory());
        Product product = new Product();
        product.setName(productDto.getName());
        product.setImage(productDto.getImage());
        product.setCateId(category.getCategoryId());
        product.setDescription(productDto.getDescription());
        product.setPrice(productDto.getPrice());
        product.setSellId(1L);
        product.setProductId(id);

        if(productService.updateProduct(product)){
            return "redirect:/products?status=update_success";
        }
        return "redirect:/products?status=update_failed";
    }

    @PostMapping("/products/delete/{id}")
    public String deleteProduct(Model model, @PathVariable Long id){

        log.info("productId delete: {}", id);

        productService.deleteByProductId(id);
        return "redirect:/products?status=delete_success";
    }

    @GetMapping("/manager/order")
    public String managerOrderStore(Model model, HttpSession session){

        Account account = (Account) session.getAttribute("account");
        if(account == null){
            return "redirect:/sign-in";
        }
        if(account.getRole() != 1){
            return "not-have-access";
        }


        List<List<TableDto>> listListTableDtos = new ArrayList<>();
        List<TableDto> coincideTable = new ArrayList<>();
        List<TableDto> tableDtos = tablesRepositoryCustom.getListTableDto();
        for(int i = 0; i < tableDtos.size() - 1; i++) {
            coincideTable.add(tableDtos.get(i));
            if (i + 1 != tableDtos.size() - 1) {
                if (!tableDtos.get(i).getTableNumber().equals(tableDtos.get(i + 1).getTableNumber())) {
                    listListTableDtos.add(new ArrayList<>(coincideTable));
                    coincideTable.clear();
                }
            } else {
                if(tableDtos.get(i).getTableNumber().equals(tableDtos.get(i + 1).getTableNumber())){
                    coincideTable.add(tableDtos.get(i + 1));
                    listListTableDtos.add(new ArrayList<>(coincideTable));
                }else {
                    listListTableDtos.add(new ArrayList<>(coincideTable));
                    coincideTable.clear();
                    coincideTable.add(tableDtos.get(i+1));
                    listListTableDtos.add(new ArrayList<>(coincideTable));
                }
            }
        }

        List<Product> products = productService.findAll();

        model.addAttribute("products",products);
        model.addAttribute("listListTableDtos", listListTableDtos);

        return "manager-order-at-store";
    }

    @PostMapping("/manager/order/table")
    public String addTable(Model model, @ModelAttribute Tables tables){
        if(tablesService.existsByTableNumberAndStatus(tables.getTableNumber(), 0L)){
            return "redirect:/manager/order?status=fail_addNumber";
        }
        tablesService.save(tables);
        return "redirect:/manager/order?status=addNumber_success";
    }

    @PostMapping("/manager/order/table/{tableNumber}")
    public String addOrderInTable(Model model, @ModelAttribute Tables tableResponse, @PathVariable Long tableNumber, HttpSession session){

        Account account = (Account) session.getAttribute("account");
        if(account == null){
            return "redirect:/sign-in";
        }
        if(account.getRole() != 1){
            return "not-have-access";
        }

        List<Tables> tables = tablesService.findByTableNumberAndStatus(tableNumber, 0L);
        if(tables.get(0).getAmount() == null && tables.get(0).getProductId() == null){
            tables.get(0).setAmount(tableResponse.getAmount());
            tables.get(0).setProductId(tableResponse.getProductId());
            tablesService.save(tables.get(0));
        } else {
            if(tablesService.existsByProductIdAndTableNumberAndStatus(tableResponse.getProductId(), tableNumber, 0L)){
                Tables tableUpdate = tablesService.findByTableNumberAndProductIdAndStatus(tableNumber, tableResponse.getProductId(), 0L);
                tableUpdate.setAmount(tableResponse.getAmount() + tableUpdate.getAmount());
                tablesService.save(tableUpdate);
            }else {
                Tables table = new Tables();
                table.setTableNumber(tableNumber);
                table.setStatus(0L);
                table.setProductId(tableResponse.getProductId());
                table.setAmount(tableResponse.getAmount());
                tablesService.save(table);
            }

        }
        return "redirect:/manager/order";
    }

    @PostMapping("/manager/export/table/{tableNumber}")
    public String exportTable(Model model, @PathVariable Long tableNumber) throws ParseException {

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        Date now = new Date();
        Date dateNow = format.parse(format.format(now));

        List<Tables> tables = tablesService.findByTableNumberAndStatus(tableNumber, 0L);
        List<Tables> updateDateAndStatus1 = new ArrayList<>();
        for(Tables table : tables){
            table.setStatus(1L);
            table.setDate(dateNow);
            updateDateAndStatus1.add(table);
        }

        //Khoi tao lai ban sau khi xuat hoa don
        Tables tableNew = new Tables();
        tableNew.setStatus(0L);
        tableNew.setTableNumber(tableNumber);
        updateDateAndStatus1.add(tableNew);

        tablesService.saveAll(updateDateAndStatus1);
        return "redirect:/manager/order?status=export_success";
    }

    @PostMapping("/manager/delete/table/{tableNumber}")
    public String deleteTable(Model model, @PathVariable Long tableNumber){

        List<Tables> tables = tablesService.findByTableNumberAndStatus(tableNumber, 0L);
        List<Tables> updateStatus3 = new ArrayList<>();
        for(Tables table : tables){
            table.setStatus(3L);
            updateStatus3.add(table);
        }
        tablesService.saveAll(updateStatus3);

        return "redirect:/manager/order?status=deleteTable_success";
    }

    @PostMapping("/manager/edit/table/product/{id}")
    public String editProductAtTable(Model model, @PathVariable Long id, @ModelAttribute Tables tablesAttribute){

        log.info("edit id: {}", id);

        Optional<Tables> tablesOptional = tablesService.findById(id);
        if (tablesOptional.isPresent()) {
            Tables table = tablesOptional.get();
            table.setProductId(tablesAttribute.getProductId());
            table.setAmount(tablesAttribute.getAmount());
            tablesService.save(table);
            return "redirect:/manager/order?status=editProductAtTable_success";
        }

        return "redirect:/manager/order?status=editProductAtTable_fail";
    }
}
