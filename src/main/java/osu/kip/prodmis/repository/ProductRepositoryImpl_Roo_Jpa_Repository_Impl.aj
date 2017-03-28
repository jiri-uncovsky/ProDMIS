// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package osu.kip.prodmis.repository;

import com.mysema.query.BooleanBuilder;
import com.mysema.query.jpa.JPQLQuery;
import com.mysema.query.types.Order;
import com.mysema.query.types.OrderSpecifier;
import com.mysema.query.types.path.NumberPath;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.transaction.annotation.Transactional;
import osu.kip.prodmis.domain.Organization;
import osu.kip.prodmis.domain.Product;
import osu.kip.prodmis.domain.QProduct;
import osu.kip.prodmis.domain.UserLogin;
import osu.kip.prodmis.repository.GlobalSearch;
import osu.kip.prodmis.repository.ProductRepositoryCustom;
import osu.kip.prodmis.repository.ProductRepositoryImpl;

privileged aspect ProductRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: ProductRepositoryImpl implements ProductRepositoryCustom;
    
    declare @type: ProductRepositoryImpl: @Transactional(readOnly = true);
    
    public Page<Product> ProductRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idProduct = new NumberPath<Long>(Long.class, "id");
        QProduct product = QProduct.product;
        JPQLQuery query = getQueryFrom(product);
        BooleanBuilder where = new BooleanBuilder();

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                product.code.containsIgnoreCase(txt)
                .or(product.name.containsIgnoreCase(txt))
                .or(product.description.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "code":
                           query.orderBy(new OrderSpecifier<String>(direction, product.code));
                           break;
                        case "name":
                           query.orderBy(new OrderSpecifier<String>(direction, product.name));
                           break;
                        case "description":
                           query.orderBy(new OrderSpecifier<String>(direction, product.description));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idProduct.asc());
        
        List<Product> results = query.list(product);
        return new PageImpl<Product>(results, pageable, totalFound);
    }
    
    public Page<Product> ProductRepositoryImpl.findAllByOrganization(Organization organizationField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idProduct = new NumberPath<Long>(Long.class, "id");
        QProduct product = QProduct.product;
        JPQLQuery query = getQueryFrom(product);
        BooleanBuilder where = new BooleanBuilder(product.organization.eq(organizationField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                product.code.containsIgnoreCase(txt)
                .or(product.name.containsIgnoreCase(txt))
                .or(product.description.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "code":
                           query.orderBy(new OrderSpecifier<String>(direction, product.code));
                           break;
                        case "name":
                           query.orderBy(new OrderSpecifier<String>(direction, product.name));
                           break;
                        case "description":
                           query.orderBy(new OrderSpecifier<String>(direction, product.description));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idProduct.asc());
        
        List<Product> results = query.list(product);
        return new PageImpl<Product>(results, pageable, totalFound);
    }
    
    public Page<Product> ProductRepositoryImpl.findAllByUserLogin(UserLogin userLoginField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idProduct = new NumberPath<Long>(Long.class, "id");
        QProduct product = QProduct.product;
        JPQLQuery query = getQueryFrom(product);
        BooleanBuilder where = new BooleanBuilder(product.productManager.eq(userLoginField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                product.code.containsIgnoreCase(txt)
                .or(product.name.containsIgnoreCase(txt))
                .or(product.description.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "code":
                           query.orderBy(new OrderSpecifier<String>(direction, product.code));
                           break;
                        case "name":
                           query.orderBy(new OrderSpecifier<String>(direction, product.name));
                           break;
                        case "description":
                           query.orderBy(new OrderSpecifier<String>(direction, product.description));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idProduct.asc());
        
        List<Product> results = query.list(product);
        return new PageImpl<Product>(results, pageable, totalFound);
    }
    
}
