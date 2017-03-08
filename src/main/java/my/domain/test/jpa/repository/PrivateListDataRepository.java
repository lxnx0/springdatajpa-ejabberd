package my.domain.test.jpa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import my.domain.test.jpa.model.PrivateListData;

@Repository
public interface PrivateListDataRepository extends JpaRepository<PrivateListData, Long> {
	
	List<PrivateListData> findByPrivateList_Username(String username);

}
