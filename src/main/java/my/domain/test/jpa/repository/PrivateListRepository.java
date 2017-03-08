package my.domain.test.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import my.domain.test.jpa.model.PrivateList;

@Repository
public interface PrivateListRepository extends JpaRepository<PrivateList, Long> {

}
