package my.domain.test.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import my.domain.test.jpa.model.Roster;
import my.domain.test.jpa.model.RosterPK;

@Repository
public interface RosterRepository extends JpaRepository<Roster, RosterPK> {

}
