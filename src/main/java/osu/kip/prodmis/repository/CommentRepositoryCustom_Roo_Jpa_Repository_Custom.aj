// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package osu.kip.prodmis.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import osu.kip.prodmis.domain.Comment;
import osu.kip.prodmis.domain.Product;
import osu.kip.prodmis.domain.UserLogin;
import osu.kip.prodmis.repository.CommentRepositoryCustom;
import osu.kip.prodmis.repository.GlobalSearch;

privileged aspect CommentRepositoryCustom_Roo_Jpa_Repository_Custom {
    
    public abstract Page<Comment> CommentRepositoryCustom.findAll(GlobalSearch globalSearch, Pageable pageable);    
    public abstract Page<Comment> CommentRepositoryCustom.findAllByProduct(Product productField, GlobalSearch globalSearch, Pageable pageable);    
    public abstract Page<Comment> CommentRepositoryCustom.findAllByUserLogin(UserLogin userLoginField, GlobalSearch globalSearch, Pageable pageable);    
    public abstract Page<Comment> CommentRepositoryCustom.findAllByComment(Comment commentField, GlobalSearch globalSearch, Pageable pageable);    
}