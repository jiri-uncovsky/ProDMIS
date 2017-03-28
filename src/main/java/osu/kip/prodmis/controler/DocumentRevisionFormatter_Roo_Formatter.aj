// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package osu.kip.prodmis.controler;

import java.text.ParseException;
import java.util.Locale;
import org.springframework.core.convert.ConversionService;
import org.springframework.format.Formatter;
import org.springframework.util.StringUtils;
import osu.kip.prodmis.controler.DocumentRevisionFormatter;
import osu.kip.prodmis.domain.DocumentRevision;
import osu.kip.prodmis.service.api.DocumentRevisionService;

privileged aspect DocumentRevisionFormatter_Roo_Formatter {
    
    declare parents: DocumentRevisionFormatter implements Formatter<DocumentRevision>;
    
    public DocumentRevisionService DocumentRevisionFormatter.documentRevisionService;
    
    public ConversionService DocumentRevisionFormatter.conversionService;
    
    public DocumentRevisionFormatter.new(DocumentRevisionService documentRevisionService, ConversionService conversionService) {
        this.documentRevisionService = documentRevisionService;
        this.conversionService = conversionService;
    }

    public DocumentRevision DocumentRevisionFormatter.parse(String text, Locale locale) throws ParseException {
        if (text == null || !StringUtils.hasText(text)) {
            return null;
        }
        Long id = conversionService.convert(text, Long.class);
        return documentRevisionService.findOne(id);
    }
    
    public String DocumentRevisionFormatter.print(DocumentRevision documentRevision, Locale locale) {
        return documentRevision == null ? null : new StringBuilder().append(documentRevision.getRevisionVersion()).append(" - ").append(documentRevision.getComment()).append(" - ").append(documentRevision.getState()).append(" - ").append(documentRevision.getFileName()).append(" - ").append(documentRevision.getFilePath()).toString();
    }
    
}
