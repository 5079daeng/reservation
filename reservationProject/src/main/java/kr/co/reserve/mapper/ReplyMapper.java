package kr.co.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.reserve.domain.Reply;

public interface ReplyMapper {
	
	@Select("select * from pinestay.reply where boardNo = #{boardNo} and deleted IS Null")
	public List<Reply> getReplyList(@Param("boardNo") int boardNo);
	
	
	@Insert("insert into pinestay.reply (boardNo, userNo, content,created) values (#{boardNo},#{userNo},#{content},now())")
	public int insertReply(@Param("boardNo") int boardNo,  @Param("userNo") int userNo, @Param("content") String content);

    @Select("Select * from pinestay.reply where replyNo = #{replyNo}")
	public Reply getReplyDate(int replyNo);

    @Update("Update pinestay.reply set content = #{reply.content} where replyNo = #{reply.replyNo} ")
	public int modify(@Param("reply")Reply reply);

    
    @Delete("Delete from pinestay.reply where replyNo = #{reply.replyNo}")
	public int delete(@Param("reply")Reply reply);
}