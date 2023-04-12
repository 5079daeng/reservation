package kr.co.reserve.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import kr.co.reserve.domain.Reply;

@Service
public interface ReplyService {
	
	
	 List<Reply> getReplyList(int boardNo); 
	 
	 int insertReply(HttpSession session , Reply reply);
		
     Reply getReplyData(int replyNo);

	int modify(Reply reply);

	int delete(Reply reply);
 	
 	
}