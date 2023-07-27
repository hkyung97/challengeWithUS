package com.smart.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.home.dao.QaCommentsDAO;
import com.smart.home.dto.QaCommentsDTO;

@Service
public class QaCommentsServiceImpl implements QaCommentsService {

	@Autowired
	QaCommentsDAO dao;

	@Override
	public int qacommentsInsert(QaCommentsDTO dto) {
		return dao.qacommentsInsert(dto);
	}

	@Override
	public List<QaCommentsDTO> qacommentsSelect(int qaNO) {
		return dao.qacommentsSelect(qaNO);
	}

	@Override
	public int qacommentsUpdate(QaCommentsDTO dto) {
		return dao.qacommentsUpdate(dto);
	}

	@Override
	public int qacommentsDelete(int qacommentNo) {
		return dao.qacommentsDelete(qacommentNo);
	}

}