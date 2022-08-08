package com.bank.api.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.api.model.Account;
import com.bank.api.model.History;

public interface HistoryRepo extends JpaRepository<History, Long>{

	List<History> findByAccountNo(Long accountNo);

	List<History> findByAccountNo(Optional<Account> accountOpt);

}
