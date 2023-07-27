package com.smart.home.dao;

import java.util.List;
import com.smart.home.dto.BoardDTO;
import com.smart.home.dto.QaBoardFileDTO;
import com.smart.home.dto.PagingDTO;

public interface BoardDAO {
	// 글등록 
	public int boardWriteOk(BoardDTO dto);
	// 글목록선택 (paging, search)
	public List<BoardDTO> boardList(PagingDTO pDTO);
	// 총 레코드 수
	public int totalRecord(PagingDTO pDTO);
	public void hitCount(int no);
	//파일명 등록
	public int qaboardfileInsert(List<QaBoardFileDTO> fileList);
	// 글 수정(update)
	public int boardEdit(BoardDTO dto);
	//글 삭제
	public int boardDel(int no, String memberId);
	//첨부파일 목록 삭제
	public int qaboardfileDelete(int no);
	//해당글의 첨부 파일 선택
	public List<QaBoardFileDTO> qaboardfileSelect(int no);
	public BoardDTO boardSelect(int no);


	
}
