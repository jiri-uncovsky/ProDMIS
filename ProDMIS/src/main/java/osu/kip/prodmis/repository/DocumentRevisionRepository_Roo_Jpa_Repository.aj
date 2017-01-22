// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package osu.kip.prodmis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import osu.kip.prodmis.domain.DocumentRevision;
import osu.kip.prodmis.repository.DocumentRevisionRepository;
import osu.kip.prodmis.repository.DocumentRevisionRepositoryCustom;

privileged aspect DocumentRevisionRepository_Roo_Jpa_Repository {
    
    declare parents: DocumentRevisionRepository extends JpaRepository<DocumentRevision, Long>;
    
    declare parents: DocumentRevisionRepository extends DocumentRevisionRepositoryCustom;
    
    declare @type: DocumentRevisionRepository: @Repository;
    
    declare @type: DocumentRevisionRepository: @Transactional(readOnly = true);
    
    public abstract Long DocumentRevisionRepository.countByCreatedById(Long id);    
    public abstract Long DocumentRevisionRepository.countByDocumentId(Long id);    
}
