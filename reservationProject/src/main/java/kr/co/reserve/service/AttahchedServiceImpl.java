package kr.co.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.reserve.domain.Attached;
import kr.co.reserve.mapper.AttachedMapper;

@Service
public  class AttahchedServiceImpl implements AttachedService {

	@Autowired
	AttachedMapper mapper; 
	
	@Override
	public Attached getFile(int fileNo)  {
		Attached file = mapper.getFile(fileNo);
		return file;
	}

	@Override
	public List<Attached> getFiles(int cateNo) {
		return mapper.getFiles(cateNo);
	}

	@Override
	public int insertFile(Attached file) {
		return mapper.insertFile(file);
	}

	@Override
	public String getFileName(int roomNo) {
		
		return mapper.getFileName(roomNo);
	}

	@Override
	public int updateFile(int roomNo, Attached file) {
		
		return mapper.updateFile(roomNo,file); 
	}
}
