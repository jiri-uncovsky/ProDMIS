// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package osu.kip.prodmis.controler;

import javax.validation.Valid;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import osu.kip.prodmis.controler.ProductController;
import osu.kip.prodmis.datatables.DatatablesData;
import osu.kip.prodmis.datatables.DatatablesPageable;
import osu.kip.prodmis.domain.Document;
import osu.kip.prodmis.domain.Product;
import osu.kip.prodmis.domain.Comment;
import osu.kip.prodmis.repository.GlobalSearch;

privileged aspect ProductController_Roo_Thymeleaf {
    
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String ProductController.list(Model model) {
        return "products/list";
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Product> ProductController.list(GlobalSearch search, Pageable pageable) {
        Page<Product> product = productService.findAll(search, pageable);
        return product;
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/vnd.datatables+json")
    @ResponseBody
    public DatatablesData<Product> ProductController.list(GlobalSearch search, DatatablesPageable pageable, @RequestParam("draw") Integer draw) {
        Page<Product> product = list(search, pageable);
        long allAvailableProduct = productService.count();
        return new DatatablesData<Product>(product, allAvailableProduct, draw);
    }
    
    @RequestMapping(value = "/create-form", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String ProductController.createForm(Model model) {
        model.addAttribute(new Product());
        populateForm(model);
        return "products/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = MediaType.TEXT_HTML_VALUE)
    public String ProductController.create(@Valid @ModelAttribute Product product, BindingResult result, RedirectAttributes redirectAttrs, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            return "products/create";
        }
        Product newProduct = productService.save(product);
        redirectAttrs.addAttribute("id", newProduct.getId());
        return "redirect:/products/{id}";
    }
    
    @RequestMapping(value = "/{product}/edit-form", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String ProductController.editForm(@PathVariable("product") Product product, Model model) {
        populateForm(model);
        return "products/edit";
    }
    
    @RequestMapping(value = "/{product}", method = RequestMethod.PUT, produces = MediaType.TEXT_HTML_VALUE)
    public String ProductController.update(@Valid @ModelAttribute Product product, BindingResult result, RedirectAttributes redirectAttrs, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            return "products/edit";
        }
        Product savedProduct = productService.save(product);
        redirectAttrs.addAttribute("id", savedProduct.getId());
        return "redirect:/products/{id}";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.TEXT_HTML_VALUE)
    public String ProductController.delete(@PathVariable("id") Long id, Model model) {
        productService.delete(id);
        return "redirect:/products";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity ProductController.delete(@PathVariable("id") Long id) {
        productService.delete(id);
        return new ResponseEntity(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{product}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String ProductController.show(@PathVariable("product") Product product, Model model) {
        return "products/show";
    }
    
    @RequestMapping(value = "/{id}/documents/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Document> ProductController.listDocument(@PathVariable("id") Product id, GlobalSearch search, Pageable pageable) {
        Page<Document> document = documentService.findAllByProduct(id, search, pageable);
        return document;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/{id}/documents/", produces = "application/vnd.datatables+json")
    @ResponseBody
    public DatatablesData<Document> ProductController.listDocument(@PathVariable("id") Product id, GlobalSearch search, Pageable pageable, @RequestParam("draw") Integer draw) {
        Page<Document> document = listDocument(id, search, pageable);
        long allAvailableDocumentDetails = documentService.countByProductId(id.getId());
        return new DatatablesData<Document>(document, allAvailableDocumentDetails, draw);
    }
    
    @RequestMapping(value = "/{id}/comments/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Comment> ProductController.listComment(@PathVariable("id") Product id, GlobalSearch search, Pageable pageable) {
        Page<Comment> comment = commentService.findAllByProduct(id, search, pageable);
        return comment;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/{id}/comments/", produces = "application/vnd.datatables+json")
    @ResponseBody
    public DatatablesData<Comment> ProductController.listComment(@PathVariable("id") Product id, GlobalSearch search, Pageable pageable, @RequestParam("draw") Integer draw) {
        Page<Comment> comment = listComment(id, search, pageable);
        long allAvailableCommentDetails = commentService.countByProductId(id.getId());
        return new DatatablesData<Comment>(comment, allAvailableCommentDetails, draw);
    }
    
    public void ProductController.populateForm(Model model) {
        populateFomats(model);
    }
    
    public void ProductController.populateFomats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
}
