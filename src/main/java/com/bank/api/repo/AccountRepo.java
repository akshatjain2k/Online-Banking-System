package com.bank.api.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.api.model.Account;

public interface AccountRepo extends JpaRepository<Account, Long>{

	Optional<Account> findByAccountNo(Long accountNo);

}
