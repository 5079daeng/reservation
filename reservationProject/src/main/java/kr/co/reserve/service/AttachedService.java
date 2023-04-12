package kr.co.reserve.service;

import java.util.List;
import org.springframework.stereotype.Service;
import kr.co.reserve.domain.Attached;

@Service
public interface AttachedService  {
	
	List<Attached> getFiles(int cateNo);
	Attached getFile(int fileNo);
	int insertFile(Attached file);
	String getFileName(int roomNo);
	int updateFile(int roomNo, Attached file);
}