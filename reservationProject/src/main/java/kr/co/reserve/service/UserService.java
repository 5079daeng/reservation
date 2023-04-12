package kr.co.reserve.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.reserve.domain.User;

@Service
public interface UserService {

	User getUser(String id);

	int checkId(String id);

	int doJoin(String id,  String pw, String name, String email, String cellphone, String address);

	String getPw(String id);

	int modifyInfo(User user);

	List<User> getUserList();

}