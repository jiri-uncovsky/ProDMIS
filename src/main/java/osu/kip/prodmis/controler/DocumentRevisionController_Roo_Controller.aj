// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package osu.kip.prodmis.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import osu.kip.prodmis.controler.DocumentRevisionController;
import osu.kip.prodmis.service.api.DocumentRevisionService;

privileged aspect DocumentRevisionController_Roo_Controller {
    
    declare @type: DocumentRevisionController: @Controller;
    
    declare @type: DocumentRevisionController: @RequestMapping("/documentrevisions");
    
    public DocumentRevisionService DocumentRevisionController.documentRevisionService;
    
    @Autowired
    public DocumentRevisionController.new(DocumentRevisionService documentRevisionService) {
        this.documentRevisionService = documentRevisionService;
    }

}
