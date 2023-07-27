package com.smart.home.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.smart.home.dto.QaCommentsDTO;
import com.smart.home.service.QaCommentsService;


@RestController
public class QaCommentsController {
    @Autowired
    QaCommentsService service;

    // 댓글등록
    @PostMapping("/qacomments/qacommentsWrite")
    public String qacommentsWrite(QaCommentsDTO dto, HttpSession session) {
        // session글쓴이 구하기
        dto.setMemberId((String)session.getAttribute("logId"));
        System.out.println(dto.toString());
        
        int result = service.qacommentsInsert(dto);
        return result + "";
    }

    // 댓글목록
    @GetMapping("/qacomments/qacommentsList")
    public List<QaCommentsDTO> qacommentsList(int qaNo) { // 원글 글 번호
        return service.qacommentsSelect(qaNo);
    }

    @PostMapping("/qacomments/qacommentsEditOk")
    // 댓글수정(DB:update)
    public String qacommentsEditOk(QaCommentsDTO dto) {
        return String.valueOf(service.qacommentsUpdate(dto));
    }

    // 댓글삭제
    @GetMapping("/qacomments/qacommentsDel")
    public String qacommentsDel(int qacommentNo) {
        return String.valueOf(service.qacommentsDelete(qacommentNo));
    }
}
