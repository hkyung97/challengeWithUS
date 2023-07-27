package com.smart.home.service;

import java.util.List;
import com.smart.home.dto.BoardDTO;
import com.smart.home.dto.PagingDTO;
import com.smart.home.dto.QaBoardFileDTO;

public interface BoardService {
	public int boardWriteOk(BoardDTO dto);
	public List<BoardDTO> boardList(PagingDTO pDTO);
	public int totalRecord(PagingDTO pDTO);
	public void hitCount(int no);
	public int boardEdit(BoardDTO dto);
	public int boardDel(int no, String memberId);
	public int qaboardfileDelete(int no);
	public List<QaBoardFileDTO> qaboardfileSelect(int no);
	public int qaboardfileInsert(List<QaBoardFileDTO> fileList);
	public BoardDTO boardSelect(int no);
	

	
	

}
