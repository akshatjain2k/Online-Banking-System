package com.bank.api.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.api.model.Fd;

public interface FdRepo extends JpaRepository<Fd, Long> {

	

	List<Fd> findByAccountNo(Long fdAccountNoOrAccountNo);

	List<Fd> findByFdAccountNo(Long fdAccountNoOrAccountNo);

	


}
