package my.domain.test.jpa;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import my.domain.test.jpa.model.PrivateListData;
import my.domain.test.jpa.model.Roster;
import my.domain.test.jpa.repository.PrivateListDataRepository;
import my.domain.test.jpa.repository.RosterRepository;

@Component
public class Runner implements CommandLineRunner {
	
	@Autowired
	private RosterRepository repo;
	
	@Autowired
	private PrivateListDataRepository privateListDataRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(Runner.class.getName());

	@Override
	public void run(String... args) throws Exception {
		List<Roster> rosterList = repo.findAll();
		
		for (Roster roster : rosterList) {
			logger.info("{} :  {}",roster.getId().getUsername(), roster.getNick());
		}
		
		List<PrivateListData> temp = privateListDataRepository.findAll();
		for (PrivateListData privateListData : temp) {
			logger.info("Blocked {} : {}", privateListData.getId(), privateListData.getValue());
		}
		
		long numberofblocked = privateListDataRepository.count();
		System.out.println("numberofblocked : " + numberofblocked);
		
		List<PrivateListData> privateLists = privateListDataRepository.findByPrivateList_Username("admin");
		System.out.println(privateLists);
		for (PrivateListData privateListData : privateLists) {
			logger.info("Blocked {} : {}", privateListData.getId(), privateListData.getValue());
		}
		
	}
	

}
