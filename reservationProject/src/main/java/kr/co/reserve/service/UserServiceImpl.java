package kr.co.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.reserve.domain.User;
import kr.co.reserve.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public User getUser(String id) {
		return userMapper.getUser(id);

	}

	@Override
	public int checkId(String id) {
		return userMapper.checkId(id);

	}

	@Override
	public int doJoin(String id, String pw, String name, String email, String cellphone, String address) {
		return userMapper.doJoin(id, pw, name, email, cellphone, address);

	}

	@Override
	public String getPw(String id) {
		return userMapper.getPW(id);
	}

	@Override
	public int modifyInfo(User user) {
		return userMapper.modifyInfo(user);
		
	
	}

	@Override
	public List<User> getUserList() {
	return	userMapper.getUserList(); 
		
	}

}
