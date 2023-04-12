package kr.co.reserve.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.reserve.domain.Reply;
import kr.co.reserve.domain.User;
import kr.co.reserve.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;

	@Override
	public List<Reply> getReplyList(int boardNo) {
		List<Reply> list = null;
		list = replyMapper.getReplyList(boardNo);
		return list;
	}

	@Override
	public int insertReply(HttpSession session, Reply reply) {

		int result = 0, boardNo = 0, userNo = 0;
		String content = null;
		User user = (User) session.getAttribute("User");
		userNo = user.getUserNo();
		boardNo = reply.getBoardNo();
		content = reply.getContent();

		result = replyMapper.insertReply(boardNo, userNo, content);
		return result;
	}

	@Override
	public Reply getReplyData(int replyNo) {
		Reply reply = null;
		reply = replyMapper.getReplyDate(replyNo);
		return reply;
	}

	@Override
	public int modify(Reply reply) {
		return replyMapper.modify(reply);
		
	}

	@Override
	public int delete(Reply reply) {
	
		return replyMapper.delete(reply);
	}

}