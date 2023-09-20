package com.cooory.memo.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cooory.memo.common.EncryptUtils;
import com.cooory.memo.user.domain.User;
import com.cooory.memo.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;

	
	
	public User addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = User.builder()
						.loginId(loginId)
						.password(encryptPassword)
						.name(name)
						.email(email)
						.build();
		
		return userRepository.save(user);
	}
}
