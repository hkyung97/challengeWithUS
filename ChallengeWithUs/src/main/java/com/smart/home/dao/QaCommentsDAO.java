package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.QaCommentsDTO;

public interface QaCommentsDAO {
	public int qacommentsInsert(QaCommentsDTO dto);
	public List<QaCommentsDTO> qacommentsSelect(int qaNO);
	public int qacommentsUpdate(QaCommentsDTO dto);
	public int qacommentsDelete(int qaco_no);
}