// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package osu.kip.prodmis.controler;

import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
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
import osu.kip.prodmis.controler.OrganizationController;
import osu.kip.prodmis.datatables.DatatablesData;
import osu.kip.prodmis.datatables.DatatablesPageable;
import osu.kip.prodmis.domain.Organization;
import osu.kip.prodmis.domain.Product;
import osu.kip.prodmis.domain.UserLogin;
import osu.kip.prodmis.repository.GlobalSearch;

privileged aspect OrganizationController_Roo_Thymeleaf {
    
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String OrganizationController.list(Model model) {
        return "organizations/list";
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Organization> OrganizationController.list(GlobalSearch search, Pageable pageable) {
        Page<Organization> organization = organizationService.findAll(search, pageable);
        return organization;
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/vnd.datatables+json")
    @ResponseBody
    public DatatablesData<Organization> OrganizationController.list(GlobalSearch search, DatatablesPageable pageable, @RequestParam("draw") Integer draw) {
        Page<Organization> organization = list(search, pageable);
        long allAvailableOrganization = organizationService.count();
        return new DatatablesData<Organization>(organization, allAvailableOrganization, draw);
    }
    
    @RequestMapping(value = "/create-form", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String OrganizationController.createForm(Model model) {
        model.addAttribute(new Organization());
        populateForm(model);
        return "organizations/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = MediaType.TEXT_HTML_VALUE)
    public String OrganizationController.create(@Valid @ModelAttribute Organization organization, BindingResult result, RedirectAttributes redirectAttrs, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            return "organizations/create";
        }
        Organization newOrganization = organizationService.save(organization);
        redirectAttrs.addAttribute("id", newOrganization.getId());
        return "redirect:/organizations/{id}";
    }
    
    @RequestMapping(value = "/{organization}/edit-form", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String OrganizationController.editForm(@PathVariable("organization") Organization organization, Model model) {
        populateForm(model);
        return "organizations/edit";
    }
    
    @RequestMapping(value = "/{organization}", method = RequestMethod.PUT, produces = MediaType.TEXT_HTML_VALUE)
    public String OrganizationController.update(@Valid @ModelAttribute Organization organization, BindingResult result, RedirectAttributes redirectAttrs, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            return "organizations/edit";
        }
        Organization savedOrganization = organizationService.save(organization);
        redirectAttrs.addAttribute("id", savedOrganization.getId());
        return "redirect:/organizations/{id}";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.TEXT_HTML_VALUE)
    public String OrganizationController.delete(@PathVariable("id") Long id, Model model) {
        organizationService.delete(id);
        return "redirect:/organizations";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity OrganizationController.delete(@PathVariable("id") Long id) {
        organizationService.delete(id);
        return new ResponseEntity(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{organization}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String OrganizationController.show(@PathVariable("organization") Organization organization, Model model) {
        return "organizations/show";
    }
    
    @RequestMapping(value = "/{id}/products/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Product> OrganizationController.listProduct(@PathVariable("id") Organization id, GlobalSearch search, Pageable pageable) {
        Page<Product> product = productService.findAllByOrganization(id, search, pageable);
        return product;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/{id}/products/", produces = "application/vnd.datatables+json")
    @ResponseBody
    public DatatablesData<Product> OrganizationController.listProduct(@PathVariable("id") Organization id, GlobalSearch search, Pageable pageable, @RequestParam("draw") Integer draw) {
        Page<Product> product = listProduct(id, search, pageable);
        long allAvailableProductDetails = productService.countByOrganizationId(id.getId());
        return new DatatablesData<Product>(product, allAvailableProductDetails, draw);
    }
    
    @RequestMapping(value = "/{id}/userlogins/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<UserLogin> OrganizationController.listUserLogin(@PathVariable("id") Organization id, GlobalSearch search, Pageable pageable) {
        Page<UserLogin> userLogin = userLoginService.findAllByOrganization(id, search, pageable);
        return userLogin;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/{id}/userlogins/", produces = "application/vnd.datatables+json")
    @ResponseBody
    public DatatablesData<UserLogin> OrganizationController.listUserLogin(@PathVariable("id") Organization id, GlobalSearch search, Pageable pageable, @RequestParam("draw") Integer draw) {
        Page<UserLogin> userLogin = listUserLogin(id, search, pageable);
        long allAvailableUserLoginDetails = userLoginService.countByOrganizationId(id.getId());
        return new DatatablesData<UserLogin>(userLogin, allAvailableUserLoginDetails, draw);
    }
    
    public void OrganizationController.populateForm(Model model) {
        populateFomats(model);
    }
    
    public void OrganizationController.populateFomats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("createTime_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
}
