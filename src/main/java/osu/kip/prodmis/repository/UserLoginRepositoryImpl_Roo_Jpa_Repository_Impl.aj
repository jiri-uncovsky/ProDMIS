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
import osu.kip.prodmis.domain.QUserLogin;
import osu.kip.prodmis.domain.UserLogin;
import osu.kip.prodmis.repository.GlobalSearch;
import osu.kip.prodmis.repository.UserLoginRepositoryCustom;
import osu.kip.prodmis.repository.UserLoginRepositoryImpl;

privileged aspect UserLoginRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: UserLoginRepositoryImpl implements UserLoginRepositoryCustom;
    
    declare @type: UserLoginRepositoryImpl: @Transactional(readOnly = true);
    
    public Page<UserLogin> UserLoginRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idUserLogin = new NumberPath<Long>(Long.class, "id");
        QUserLogin userLogin = QUserLogin.userLogin;
        JPQLQuery query = getQueryFrom(userLogin);
        BooleanBuilder where = new BooleanBuilder();

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                userLogin.username.containsIgnoreCase(txt)
                .or(userLogin.password.containsIgnoreCase(txt))
                .or(userLogin.name.containsIgnoreCase(txt))
                .or(userLogin.surname.containsIgnoreCase(txt))
                .or(userLogin.email.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "username":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.username));
                           break;
                        case "password":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.password));
                           break;
                        case "name":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.name));
                           break;
                        case "surname":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.surname));
                           break;
                        case "email":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.email));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idUserLogin.asc());
        
        List<UserLogin> results = query.list(userLogin);
        return new PageImpl<UserLogin>(results, pageable, totalFound);
    }
    
    public Page<UserLogin> UserLoginRepositoryImpl.findAllByOrganization(Organization organizationField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idUserLogin = new NumberPath<Long>(Long.class, "id");
        QUserLogin userLogin = QUserLogin.userLogin;
        JPQLQuery query = getQueryFrom(userLogin);
        BooleanBuilder where = new BooleanBuilder(userLogin.organization.eq(organizationField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                userLogin.username.containsIgnoreCase(txt)
                .or(userLogin.password.containsIgnoreCase(txt))
                .or(userLogin.name.containsIgnoreCase(txt))
                .or(userLogin.surname.containsIgnoreCase(txt))
                .or(userLogin.email.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "username":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.username));
                           break;
                        case "password":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.password));
                           break;
                        case "name":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.name));
                           break;
                        case "surname":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.surname));
                           break;
                        case "email":
                           query.orderBy(new OrderSpecifier<String>(direction, userLogin.email));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idUserLogin.asc());
        
        List<UserLogin> results = query.list(userLogin);
        return new PageImpl<UserLogin>(results, pageable, totalFound);
    }
    
}