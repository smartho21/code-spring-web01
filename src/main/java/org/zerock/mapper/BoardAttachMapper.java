package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long bno);
	
	//첨부파일의 삭제
	public void deleteAll(Long bno);
	
	//잘못 업로드된 파일 삭제
	public List<BoardAttachVO> getOldFiles();
}
