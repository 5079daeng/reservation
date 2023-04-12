package kr.co.reserve.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import kr.co.reserve.domain.Board;

public interface BoardMapper {
	
	@Insert("insert into pinestay.board (category ,title, content, userNo, userId, created)  values  (#{category}, #{title}, #{content},#{userNo}, #{userId}, now())")
	public int insert(@Param("category") String category , @Param("title") String title, @Param("content") String content , @Param("userNo") int userNo, @Param("userId") String userId); 
    
	//@Select("select * from pinestay.ps_board where deleted IS NULL order by no desc") 
    //public List<Ask> select();
	
	@Select("select a.*, (select count(*) from pinestay.reply b where b.boardNo = a.boardNo) as reply from pinestay.board a order by a.boardNo desc LIMIT #{limit} OFFSET #{start};")
	 public List<Board> select(@Param("start") int start, @Param("limit") int limit);
	
	@Select("select * from pinestay.board where  boardNo = #{boardNo}")
	public Board getDetail(int boardNo); 
	
	@Update("Update pinestay.board set category = #{board.category}, title =#{board.title}, content = #{board.content}  where boardNo = #{board.boardNo}")
	public int modify(@Param("board")Board board);
    
	
	@Delete("Delete from pinestay.board where boardNo = #{boardNo}")
	public int delete(int boardNo);

	@Select("Select count(*) from board")
	public int getTotal();

}
