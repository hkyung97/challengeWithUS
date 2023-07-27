package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.QaCommentsDTO;

public interface QaCommentsService {
	public int qacommentsInsert(QaCommentsDTO dto);
	public List<QaCommentsDTO> qacommentsSelect(int qaNO);
	public int qacommentsUpdate(QaCommentsDTO dto);
	public int qacommentsDelete(int qacommentNo);
}

