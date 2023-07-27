package com.smart.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.BoardDAO;
import com.smart.home.dto.BoardDTO;
import com.smart.home.dto.PagingDTO;
import com.smart.home.dto.QaBoardFileDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO dao;

	@Override
	public int boardWriteOk(BoardDTO dto) {
		return dao.boardWriteOk(dto);
	}

	@Override
	public List<BoardDTO> boardList(PagingDTO pDTO) {
		return dao.boardList(pDTO);
	}


	@Override
	public void hitCount(int no) {
		dao.hitCount(no);
		
	}

	@Override
	public int boardEdit(BoardDTO dto) {
		return dao.boardEdit(dto);
	}

	@Override
	public int boardDel(int no, String memberId) {
		return dao.boardDel(no, memberId);
	}

	@Override
	public int totalRecord(PagingDTO pDTO) {
		return dao.totalRecord(pDTO);
	}

	@Override
	public List<QaBoardFileDTO> qaboardfileSelect(int no) {
		return dao.qaboardfileSelect(no);
	}

	@Override
	public int qaboardfileInsert(List<QaBoardFileDTO> fileList) {
		return dao.qaboardfileInsert(fileList);
	}

	@Override
	public BoardDTO boardSelect(int no) {
		return dao.boardSelect(no);
	}

	@Override
	public int qaboardfileDelete(int no) {
		return dao.qaboardfileDelete(no);
	}

	
}
