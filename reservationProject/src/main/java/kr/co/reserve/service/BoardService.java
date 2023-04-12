package kr.co.reserve.service;
import java.util.List;
import org.springframework.stereotype.Service;

import kr.co.reserve.domain.Board;


@Service
public interface BoardService {

	int askInsert(Board ask);

	List<Board> getList(int total, int page);

	Board getDetail(int no);
	
	int modify(Board ask);

	int delete(int no);

	int getCount();

}
