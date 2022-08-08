package com.bank.api.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bank.api.data.AccountData;
import com.bank.api.model.Account;
import com.bank.api.model.ApiResponse;
import com.bank.api.model.Fd;
import com.bank.api.model.History;
import com.bank.api.repo.AccountRepo;
import com.bank.api.repo.FdRepo;
import com.bank.api.repo.HistoryRepo;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api/bank")
public class AccountController {

	@Autowired
	AccountRepo accountRepo;
	
	@Autowired
	HistoryRepo historyRepo;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	FdRepo fdRepo;
	
	@GetMapping("/getAll")
	public List<Account> getAll(){
		return accountRepo.findAll();
	}
	
	@PostMapping("/add")
	public ResponseEntity<?> add(@RequestBody AccountData account){
		Optional<Account> accountOpt = accountRepo.findById(account.getId());

		if(!accountOpt.isPresent()) {
			Account accountObj = new Account();
			accountObj.setName(account.getName());
			accountObj.setAadharNo(account.getAadharNo());
			accountObj.setAddress(account.getAddress());
			accountObj.setCity(account.getCity());
			accountObj.setCountry(account.getCountry());
			accountObj.setMobileNo(account.getMobileNo());
			accountObj.setPanCardNo(account.getPanCardNo());
			accountObj.setState(account.getState());
			accountObj.setCreatedDate(account.getCreatedDate());
			accountObj.setAmmount(account.getAmmount());
			accountObj.setAccountNo(account.getAccountNo());
			if(account.getAmmount()<500) {
				return new ResponseEntity<>(new ApiResponse(false, "Ammount value is less than 500"),HttpStatus.BAD_REQUEST);
			}
			accountRepo.save(accountObj);
			
			History historyOpt = new History();
			historyOpt.setAccountNo(account.getAccountNo());
			historyOpt.setAmmount(account.getAmmount());
			historyOpt.setType("Credit");
			historyOpt.setCreatedDate(new Date());
			historyOpt.setDescription("New Account !! Credited");
			historyRepo.save(historyOpt);
			
			return new ResponseEntity<>(new ApiResponse(true, "Account added successfully"),HttpStatus.OK);
		}
		return new ResponseEntity<>(new ApiResponse(false, "error"),HttpStatus.BAD_REQUEST);
		
	}
	
	@PostMapping("/edit")
	public ResponseEntity<?> edit(@RequestBody AccountData account){
		Optional<Account> accountOpt = accountRepo.findById(account.getId());

		if(accountOpt.isPresent()) {
	//		Account accountObj = new Account();
			accountOpt.get().setName(account.getName());
			accountOpt.get().setAadharNo(account.getAadharNo());
			accountOpt.get().setAddress(account.getAddress());
			accountOpt.get().setCity(account.getCity());
			accountOpt.get().setCountry(account.getCountry());
			accountOpt.get().setMobileNo(account.getMobileNo());
			accountOpt.get().setPanCardNo(account.getPanCardNo());
			accountOpt.get().setState(account.getState());
			accountOpt.get().setCreatedDate(account.getCreatedDate());
			accountOpt.get().setAmmount(account.getAmmount());
			accountOpt.get().setAccountNo(account.getAccountNo());
			accountRepo.save(accountOpt.get());
			
			History historyOpt = new History();
			historyOpt.setAccountNo(account.getAccountNo());
			historyOpt.setAmmount(account.getAmmount());
			historyOpt.setType("Credit");
			historyOpt.setCreatedDate(new Date());
			historyOpt.setDescription("Update Account !!");
			historyRepo.save(historyOpt);
			
			return new ResponseEntity<>(new ApiResponse(true, "Account updated successfully"),HttpStatus.OK);
		}
		return new ResponseEntity<>(new ApiResponse(false, "id not present"),HttpStatus.BAD_REQUEST);
		
	}
	
	@PostMapping("/credit")
	public ResponseEntity<?> credit(@RequestParam Long accountNo ,@RequestParam double ammount){
		
		Optional<Account> accountOpt = accountRepo.findByAccountNo(accountNo);
		if(accountOpt.isPresent()) {
			
			double amm = accountOpt.get().getAmmount() + ammount;
			accountOpt.get().setAmmount(amm);
			accountRepo.save(accountOpt.get());
			
			History historyOpt = new History();
			historyOpt.setAccountNo(accountNo);
			historyOpt.setAmmount(ammount);
			historyOpt.setType("Credit");
			historyOpt.setCreatedDate(new Date());
			historyOpt.setDescription("This is Credited");
			historyRepo.save(historyOpt);
			
			return new ResponseEntity<>(new ApiResponse(true,"Ammount Crediited Successfully & Your Balance is: "+amm),HttpStatus.OK);
		}
		return new ResponseEntity<>(new ApiResponse(false, "Account Number is not present"),HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/debit")
	public ResponseEntity<?> debit(@RequestParam Long accountNo ,@RequestParam double ammount){
		
		Optional<Account> accountOpt = accountRepo.findByAccountNo(accountNo);
		if(accountOpt.isPresent()) {
			
			double amm = accountOpt.get().getAmmount() - ammount;
			accountOpt.get().setAmmount(amm);
			accountRepo.save(accountOpt.get());
			
			History historyOpt = new History();
			historyOpt.setAccountNo(accountNo);
			historyOpt.setAmmount(ammount);
			historyOpt.setType("Debit");
			historyOpt.setCreatedDate(new Date());
			historyOpt.setDescription("This is Debited");
			historyRepo.save(historyOpt);
			
			
			return new ResponseEntity<>(new ApiResponse(true,"Ammount Debited Successfully & Your Balance is: "+amm),HttpStatus.OK);
		}
		return new ResponseEntity<>(new ApiResponse(false, "Account Number is not present"),HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/transfer")
	public ResponseEntity<?> transfer(@RequestParam Long senderAccount , @RequestParam Long receiverAccount, @RequestParam Long ammount){
		Optional<Account> account1 = accountRepo.findByAccountNo(senderAccount);
		Optional<Account> account2 = accountRepo.findByAccountNo(receiverAccount);
		String s = account1.get().getName();
		String r = account2.get().getName();
		if(account1.isPresent()) {
			
			double a = account1.get().getAmmount();
			if(ammount>=a) {
				return new ResponseEntity<>(new ApiResponse(false, "Insuficient Balance"),HttpStatus.BAD_REQUEST);
			}
			double b = a - ammount;
			account1.get().setAmmount(b);
//			account1.get().setStatement(ammount.toString()+"-"+"Debit"+ " ,"+c);
			accountRepo.save(account1.get());
			
			History historyOpt = new History();
			historyOpt.setAccountNo(senderAccount);
			historyOpt.setAmmount(ammount);
			historyOpt.setType("Debit");
			historyOpt.setCreatedDate(new Date());
			historyOpt.setDescription(s+" is a Sender, "+s+("["+senderAccount+"]")+" Sends To "+r+("["+receiverAccount+"]")+" $"+ammount);
			historyRepo.save(historyOpt);
			
		}
		if(account2.isPresent()) {
			double a = account2.get().getAmmount();
			double b = a + ammount;
			account2.get().setAmmount(b);
//			account2.get().setStatement(ammount.toString()+"-"+"Credit"+ " ,"+c);
			accountRepo.save(account2.get());
			
			History historyOpt = new History();
			historyOpt.setAccountNo(receiverAccount);
			historyOpt.setAmmount(ammount);
			historyOpt.setType("Credit");
			historyOpt.setCreatedDate(new Date());
			historyOpt.setDescription(r+" is a Reciver, "+r+("["+receiverAccount+"]")+" Recieves "+" $"+ammount+" From "+s+("["+senderAccount+"]"));
			historyRepo.save(historyOpt);
		}
		return new ResponseEntity<>(new ApiResponse(true,"Transefer successfully"),HttpStatus.OK);
	}
	
	@GetMapping("/getAccount")
	public ResponseEntity<?> getAccountByAccountNo(@RequestParam Long accountNo){
		Optional<Account> accountOpt = accountRepo.findByAccountNo(accountNo);
		if(accountOpt.isPresent()) {
			return new ResponseEntity<>(accountOpt,HttpStatus.OK);
		}else {
			return new ResponseEntity<>(new ApiResponse(false,"AccountNumber is not present"),HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping("/getStatement")
	public ResponseEntity<?> getAcStatementByAcNo(@RequestParam Long accountNo){
		Optional<Account> accountOpt = accountRepo.findByAccountNo(accountNo);
		if(accountOpt.isPresent()) {
			List<History> historyOpt = historyRepo.findByAccountNo(accountNo);
			return new ResponseEntity<>(historyOpt,HttpStatus.OK);
		}else {
			return new ResponseEntity<>(new ApiResponse(false,"AccountNumber is not present"),HttpStatus.BAD_REQUEST);
		}
	} 
	
	@GetMapping("/sendMail")
	public ResponseEntity<?> sendMail(@RequestParam String mail){
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(mail);
		msg.setText("i am Mangal");
		javaMailSender.send(msg);
		return new ResponseEntity<>(new ApiResponse(true,"Mail Sent Successfully"),HttpStatus.OK);
	}
	
	@PostMapping("/fd")
	public ResponseEntity<?> fdAdd(@RequestBody Fd fd){
		
		Optional<Account> accountOpt = accountRepo.findByAccountNo(fd.getAccountNo());
		if(!accountOpt.isPresent()) {
			return new ResponseEntity<>(new ApiResponse(false,"AccountNumber is not present"),HttpStatus.BAD_REQUEST);

		}
		
		Optional<Fd> fdOpt = fdRepo.findById(fd.getId());
		
		if(!fdOpt.isPresent()) {
			Fd fdObj = new Fd();
			
			fdObj.setAmmount(fd.getAmmount());
			fdObj.setMonths(fd.getMonths());
			fdObj.setCreatedDate(fd.getCreatedDate());
			
			Random rand = new Random();
		    long randfd = rand.nextInt(100000);
			fdObj.setFdAccountNo(randfd);
			fdObj.setAccountNo(accountOpt.get().getAccountNo());
			
			double am = accountOpt.get().getAmmount() - fd.getAmmount();
			accountOpt.get().setAmmount(am);
			accountRepo.save(accountOpt.get());
			fdRepo.save(fdObj);
			
			History historyOpt = new History();
			historyOpt.setAccountNo(accountOpt.get().getAccountNo());
			historyOpt.setAmmount(fd.getAmmount());
			historyOpt.setType("FD");
			historyOpt.setCreatedDate(new Date());
			historyOpt.setDescription("For FD");
			historyRepo.save(historyOpt);
		}
		return new ResponseEntity<>(new ApiResponse(true,"FD Added Successfully"),HttpStatus.OK);

	}
	
	@GetMapping("/getFdByFdAccountNo")
	public ResponseEntity<?> getFdByFdAccountNo(@RequestParam Long fdAccountNoOrAccountNo){
		
		List<Fd> fdOpt = fdRepo.findByFdAccountNo(fdAccountNoOrAccountNo);
		if(!fdOpt.isEmpty()) {
			return new ResponseEntity<>(fdOpt,HttpStatus.OK);
		}
		List<Fd> fdOpt1 = fdRepo.findByAccountNo(fdAccountNoOrAccountNo);
		if(!fdOpt1.isEmpty()) {
			return new ResponseEntity<>(fdOpt1,HttpStatus.OK);
		}
			
		return new ResponseEntity<>(new ApiResponse(false,"FD and AccountNo is not Present"),HttpStatus.BAD_REQUEST);
	}
	
	@GetMapping("/getAllAccountDetails")
	public ResponseEntity<?> getAllAccountDetails(){
		
		List<Account> ac = accountRepo.findAll();
		List<Account> acc = ac.stream().map(account ->{
			
			//Account ac0 = new Account();
			
			List<Fd> fd = fdRepo.findByAccountNo(account.getAccountNo());
			List<Fd> fdd = fd.stream().map(fd0 ->{
			
			 //Fd fd1 = new Fd();
			 return fd0;
				
			}).collect(Collectors.toList());
			account.setFd(fdd);
			return account;
			
		}).collect(Collectors.toList());
		 return new ResponseEntity<>(acc,HttpStatus.OK);
		 
	}
	
	@GetMapping("/getAccountDetailsByAcNo")
	public ResponseEntity<?> getAccountDetailsByAcNo(@RequestParam Long acNo){
		
		Optional<Account> ac = accountRepo.findByAccountNo(acNo);
	
		if(!ac.isPresent()) {
			return new ResponseEntity<>(new ApiResponse(false,"AccountNumber is not present"),HttpStatus.BAD_REQUEST);
		}			
			List<Fd> fd = fdRepo.findByAccountNo(ac.get().getAccountNo());
			List<Fd> fdd = fd.stream().map(fd0 ->{
						
			 return fd0;
				
			}).collect(Collectors.toList());
			ac.get().setFd(fdd);
			
		 return new ResponseEntity<>(ac,HttpStatus.OK);
	}
}
