package kr.co.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.reserve.domain.User;

public interface UserMapper {
	
	@Select("select count(*) from pinestay.user where id = #{id}")
	public int checkId(@Param("id") String id); 
	
	@Select ("select * from pinestay.user where id = #{id}")
	public User getUser(@Param("id") String id);
	
	@Insert("insert into pinestay.user (id, pw, name, email, cellphone, address, created)  values  (#{id}, #{pw}, #{name}, #{email},#{cellphone},#{address},now())")
	public int doJoin(@Param("id") String id , @Param("pw") String pw, @Param("name") String name, @Param("email") String eamil , 
			@Param("cellphone") String cellphone, @Param("address") String address); 

	@Select("select pw from pinestay.user where id = #{id}")
	public String getPW(@Param("id") String id);
    
	@Update("Update pinestay.user  set pw =#{user.pw}, email = #{user.email}, cellphone = #{user.cellphone}, address = #{user.address} where memberNo =#{user.no} ")
	public int modifyInfo(@Param("user")User user);

	 
	@Select("Select * from pinestay.user ")
	public List<User> getUserList();
	

}
