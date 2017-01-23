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
import osu.kip.prodmis.domain.Comment;
import osu.kip.prodmis.domain.Product;
import osu.kip.prodmis.domain.QComment;
import osu.kip.prodmis.domain.UserLogin;
import osu.kip.prodmis.repository.CommentRepositoryCustom;
import osu.kip.prodmis.repository.CommentRepositoryImpl;
import osu.kip.prodmis.repository.GlobalSearch;

privileged aspect CommentRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare parents: CommentRepositoryImpl implements CommentRepositoryCustom;
    
    declare @type: CommentRepositoryImpl: @Transactional(readOnly = true);
    
    public Page<Comment> CommentRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idComment = new NumberPath<Long>(Long.class, "id");
        QComment comment = QComment.comment;
        JPQLQuery query = getQueryFrom(comment);
        BooleanBuilder where = new BooleanBuilder();

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                comment.subject.containsIgnoreCase(txt)
                .or(comment.text.containsIgnoreCase(txt))
                .or(comment.quotedText.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "subject":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.subject));
                           break;
                        case "text":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.text));
                           break;
                        case "quotedText":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.quotedText));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idComment.asc());
        
        List<Comment> results = query.list(comment);
        return new PageImpl<Comment>(results, pageable, totalFound);
    }
    
    public Page<Comment> CommentRepositoryImpl.findAllByProduct(Product productField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idComment = new NumberPath<Long>(Long.class, "id");
        QComment comment = QComment.comment;
        JPQLQuery query = getQueryFrom(comment);
        BooleanBuilder where = new BooleanBuilder(comment.product.eq(productField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                comment.subject.containsIgnoreCase(txt)
                .or(comment.text.containsIgnoreCase(txt))
                .or(comment.quotedText.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "subject":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.subject));
                           break;
                        case "text":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.text));
                           break;
                        case "quotedText":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.quotedText));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idComment.asc());
        
        List<Comment> results = query.list(comment);
        return new PageImpl<Comment>(results, pageable, totalFound);
    }
    
    public Page<Comment> CommentRepositoryImpl.findAllByUserLogin(UserLogin userLoginField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idComment = new NumberPath<Long>(Long.class, "id");
        QComment comment = QComment.comment;
        JPQLQuery query = getQueryFrom(comment);
        BooleanBuilder where = new BooleanBuilder(comment.userLogin.eq(userLoginField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                comment.subject.containsIgnoreCase(txt)
                .or(comment.text.containsIgnoreCase(txt))
                .or(comment.quotedText.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "subject":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.subject));
                           break;
                        case "text":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.text));
                           break;
                        case "quotedText":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.quotedText));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idComment.asc());
        
        List<Comment> results = query.list(comment);
        return new PageImpl<Comment>(results, pageable, totalFound);
    }
    
    public Page<Comment> CommentRepositoryImpl.findAllByComment(Comment commentField, GlobalSearch globalSearch, Pageable pageable) {
        NumberPath<Long> idComment = new NumberPath<Long>(Long.class, "id");
        QComment comment = QComment.comment;
        JPQLQuery query = getQueryFrom(comment);
        BooleanBuilder where = new BooleanBuilder(comment.replyTo.eq(commentField));

        if (globalSearch != null) {
            String txt = globalSearch.getText();
            where.and(
                comment.subject.containsIgnoreCase(txt)
                .or(comment.text.containsIgnoreCase(txt))
                .or(comment.quotedText.containsIgnoreCase(txt))
            );

        }
        query.where(where);

        long totalFound = query.count();
        if (pageable != null) {
            if (pageable.getSort() != null) {
                for (Sort.Order order : pageable.getSort()) {
                    Order direction = order.isAscending() ? Order.ASC : Order.DESC;

                    switch(order.getProperty()){
                        case "subject":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.subject));
                           break;
                        case "text":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.text));
                           break;
                        case "quotedText":
                           query.orderBy(new OrderSpecifier<String>(direction, comment.quotedText));
                           break;
                    }
                }
            }
            query.offset(pageable.getOffset()).limit(pageable.getPageSize());
        }
        query.orderBy(idComment.asc());
        
        List<Comment> results = query.list(comment);
        return new PageImpl<Comment>(results, pageable, totalFound);
    }
    
}
