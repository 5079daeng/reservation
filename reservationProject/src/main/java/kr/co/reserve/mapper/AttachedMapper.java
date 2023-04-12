package kr.co.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.reserve.domain.Attached;

public interface AttachedMapper {
	@Select("Select * from pinestay.file where category = 'room' and cateNo = #{cateNo}")
	public List<Attached> getFiles(@Param("cateNo") int cateNo);
	
	@Select("Select * from pinestay.file where category = 'room' and fileNo = #{fileNo}")
	public Attached getFile(@Param("fileNo") int fileNo);

	@Insert("Insert into pinestay.file (realTitle, codeTitle, category, cateNo) values (#{file.realTitle},#{file.codeTitle},#{file.category},#{file.cateNo}) ")
	public int insertFile(@Param("file") Attached file);

	@Select("Select codeTitle from pinestay.file where cateNo = #{cateNo}")
	public String getFileName(@Param("cateNo") int cateNo);

	@Update("Update pinestay.file set realTitle = #{file.realTitle}, codeTitle =#{file.codeTitle} where cateNo = #{roomNo}")
	public int updateFile(@Param("roomNo")int roomNo, @Param("file") Attached file); 
	
}