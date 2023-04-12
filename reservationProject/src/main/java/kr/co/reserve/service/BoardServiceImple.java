package kr.co.reserve.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.reserve.domain.Board;
import kr.co.reserve.mapper.BoardMapper;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	BoardMapper mapper;

	@Override
	public int askInsert(Board board) {
		int result = 0;
		String cate, title, content, userId = null;
		int memberNo = 0;
		cate = board.getCategory();
		title = board.getTitle();
		content = board.getContent();
		memberNo = board.getUserNo();
		userId = board.getUserId();
		
		result = mapper.insert(cate, title, content, memberNo,userId);

		return result;
	}

	@Override
	public List<Board> getList(int total, int page) {
		int start = (page - 1) * 5;
		int limit = 5;
		if (total % 5 > 0 && page == (total/5 +1)) {
		    limit = total % 5;
		} 
		List<Board> list = null;
		System.out.println(start+"//"+limit);
		list = mapper.select(start,limit);
		return list;
	}

	@Override
	public Board getDetail(int no) {

		Board ask = null;
		ask = mapper.getDetail(no);
		return ask;
	}

	@Override
	public int modify(Board board) {
		return mapper.modify(board);
	}

	@Override
	public int delete(int no) {
		return mapper.delete(no);

	}

	@Override
	public int getCount() {
		
		return mapper.getTotal();
	}

}