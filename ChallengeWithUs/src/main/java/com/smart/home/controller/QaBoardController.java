package com.smart.home.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.BoardDTO;
import com.smart.home.dto.PagingDTO;
import com.smart.home.dto.QaBoardFileDTO;
import com.smart.home.service.BoardService;


@Controller
@RequestMapping("/board")
public class QaBoardController {

    @Autowired
	BoardService service;

    // 글 목록
    @GetMapping("/boardList")
	public ModelAndView boardList(PagingDTO pDTO) {
		System.out.println(pDTO);
	      // 총 레코드 수 선택      
	      pDTO.setTotalRecord(service.totalRecord(pDTO));
	      // 해당페이지 레코드 선택
	      List<BoardDTO> list = service.boardList(pDTO);
	      // ModelAndView
	      System.out.println(list);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list", list); // 아래 jsp파일에서 사용할 수 있는 변수가 됨
	      mav.addObject("pDTO", pDTO); // 현재페이지, 검색어, 검색키
	      mav.setViewName("board/boardList");
	      return mav;
	   }
	
	   // 글쓰기 폼으로 이동
	   @GetMapping("/qaBoardWrite")
	   public ModelAndView boardWrite() {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("board/qaBoardWrite");
	      return mav;
	   }

	// 글쓰기 DB기록
	   @PostMapping("/boardWriteOk")
	   public ModelAndView boardWriteOk(HttpServletRequest request, BoardDTO dto) {
	      // HttpServletRequest -> request, HttpSession
	      // HttpSession -> Session만
		   
	  String path = request.getSession().getServletContext().getRealPath("/upload");
	  
	  System.out.println("path->" + path);
	  System.out.println(dto.toString());
	  dto.setMemberId((String)request.getSession().getAttribute("logId"));
	  
	  
		//--------------------파일 업로드--------------------
		//1. 파일 업로드를 위해서 request객체를 multipartRequest 객체로 형변환한다.
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		
		
		//2. MultipartFile객체를 얻어오기
		List<MultipartFile> fileList = mr.getFiles("qafileName");
		System.out.println("fileList.size()->" + fileList.size());
		
		
		//업로드한 파일들을 보관할 컬렉션
		List<QaBoardFileDTO> upFileList = new ArrayList<QaBoardFileDTO>();
		
		if(fileList!=null){//첨부파일이 있을 때 if 1
			
			for(int i=0; i<fileList.size(); i++){//첨부파일 수 만큼 반복 수행
				MultipartFile mf = fileList.get(i);//첨부된 .MultipartFile객체 얻어오기
			
				String orgFileName = mf.getOriginalFilename();//파일명 얻어오기
				System.out.println("orgFileName->" + orgFileName);
				
				if(orgFileName != null && !orgFileName.equals("")) {//업로드한 파일이 있으면 if2
					
					File f = new File(path, orgFileName);
					if(f.exists()) {//true:파일이 있다. false:파일이 없다.
						//파일명 변경          0123456789
						//파일명과 확장자 분리    a.b.c.gif
						int point = orgFileName.lastIndexOf(".");//5
						String orgFile = orgFileName.substring(0,point);
						String orgExt = orgFileName.substring(point+1);//시작점
						
						for(int renameNum=1; ;renameNum++) {
							String newFileName = orgFile + " ("+renameNum+")."+orgExt;
							f = new File(path, newFileName);
							//파일이 없을 때까지 만든다
							if(!f.exists()) {//없을 때
								//새로 만들어진 파일명을 업로드 할 때 사용하여야 하므로 
								orgFileName = newFileName;
								break; //반복문 중지
							}
						}//for
					
					}
					//업로드 수행
					try {
						mf.transferTo(new File(path, orgFileName));
					}catch(Exception e) {e.printStackTrace();}
					
					System.out.println("업로드 된 파일명->" + orgFileName);
					
					QaBoardFileDTO upFileDTO = new QaBoardFileDTO();
					upFileDTO.setQafileName(orgFileName);
					upFileList.add(upFileDTO);
					
				}//if 2
			}//for 1
			
		}//if 1
		
		
	ModelAndView mav = new ModelAndView();
	try {
		//-------------DB처리-------------------
		//원글 insert -> 생성된 시퀀스 번호를 결과로 받아야 파일명을 db에 추가 할 때 사용해야 한다.
		int result = service.boardWriteOk(dto);
		
		//파일명이 있는 dto에 원글 번호를 추가
		for(int i=0; i<upFileList.size(); i++) {
			upFileList.get(i).setQaNo(dto.getQaNo());
		}
		
		//파일명 DB insert - 
		
		int resultFile = service.qaboardfileInsert(upFileList);
	
		//정상구현
		mav.setViewName("redirect:boardList");

		
	}catch(Exception e) {
		e.printStackTrace();
		//원글 지우기(dto.no)
		service.boardDel(dto.getQaNo(), dto.getMemberId());
		//파일명 지우기(dto.no)
		service.qaboardfileDelete(dto.getQaNo());
		//파일 삭제(upFileList)
		for(int i=0; i<upFileList.size(); i++) {
			fileDelete(path, upFileList.get(i).getQafileName());
		}
		
		//실패....
		mav.setViewName("qaboard/qaBoardResult");
	}		
		return mav;
	}
	//자료실 글 내용 보기
	@GetMapping("/qaBoardView")
	public ModelAndView qaBoardView(int no, PagingDTO pDTO) {
		ModelAndView mav = new ModelAndView();
		//조회수
		service.hitCount(no);
		//해당글 선택
		mav.addObject("dto", service.boardSelect(no));
		//해당글의 첨부파일 선택
		mav.addObject("fileList", service.qaboardfileSelect(no));
		mav.addObject("pDTO", pDTO);
		//뷰페이지
		mav.setViewName("board/qaBoardView");
		return mav;
	}
	//자료실 글 수정 폼
	@GetMapping("/qaBoardEdit")
	public ModelAndView qaBoardEdit(int no) {
		ModelAndView mav = new ModelAndView();
		//현재 글
		mav.addObject("dto", service.boardSelect(no));
		//첨부파일선택
		mav.addObject("fileList", service.qaboardfileSelect(no));
		
		mav.setViewName("board/qaBoardEdit");
		return mav;
	}

	//자료실 글 수정하기
	   @PostMapping("/qaBoardEditOk") //no, subject, content, filename, delFile
	   public ModelAndView qaBoardEditOk(BoardDTO dto, HttpSession session, HttpServletRequest request) {
		  dto.setMemberId((String)session.getAttribute("logId"));   
	      //1. 기존에 업로드된 파일목록 DB에서 가져오기
	      List<QaBoardFileDTO> orgFileList = service.qaboardfileSelect(dto.getQaNo());
	      
	      //2. 저장위치
	      String path = session.getServletContext().getRealPath("/upload");
	      
	      //3. 새로 추가한 파일 업로드하기-> MultipartHttpServletRequest(request객체)
	      MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
	      
	      //4. 업로드된 파일(MultipartFile)목록
	      List<MultipartFile> fileList = mr.getFiles("qafileName");
	      //새로 업로드한 파일명들
	      List<QaBoardFileDTO> newFileList = new ArrayList<QaBoardFileDTO>();
	      
	      //5. 업로드된 파일이 있으면 업로드(rename)
	      if(fileList != null) {
	         for(int i=0;i<fileList.size(); i++) {
	            MultipartFile mf = fileList.get(i);
	            //파일명구하기
	            String orgFileName = mf.getOriginalFilename();
	            if(orgFileName != null && !orgFileName.equals("")){//파일명이 있으면
	               File f = new File(path, orgFileName);
	               if(f.exists()) {//같은 파일명을 가진 파일이 존재하면
	                  //기존파일명과 중복검사
	                  int p = orgFileName.lastIndexOf(".");
	                  String fileNoExt = orgFileName.substring(0, p);
	                  String ext = orgFileName.substring(p+1);
	                  
	                  for(int fileNum=1; ; fileNum++) {
	                     String newFile = fileNoExt+" ("+fileNum+")."+ext;
	                     f = new File(path, newFile);
	                     if(!f.exists()) {
	                        orgFileName = newFile;
	                        break;
	                     }//if
	                  }//for
	               }//if   
	               //업로드
	               try {
	                  mf.transferTo(new File(path, orgFileName));
	                  QaBoardFileDTO fDTO = new QaBoardFileDTO();
	                  fDTO.setQaNo(dto.getQaNo());
	                  fDTO.setQafileName(orgFileName);
	                  newFileList.add(fDTO);
	               } catch (Exception e) {e.printStackTrace();}
	            }//if
	         }//for
	      }//if
	      //DB등록
	      /*
	       *    원래 DB파일     -> List<DataFileDTO> orgFileList
	       *  새로 업로드된 파일 -> ListMDataFileDTO> newFileList
	       *  삭제된파일       -> List<String> delFile
	       */
	      // orgFileList에 새로 업로드된 파일목록을 추가하기
	      //orgFileList.addAll(newFileList);
	      for(QaBoardFileDTO newDTO:newFileList) {
	         orgFileList.add(newDTO);
	      }
	      if(dto.getDelFile()!=null) {//삭제파일이 있으면
	         for(int i=0;i<dto.getDelFile().size();i++) {
	            String del = dto.getDelFile().get(i);
	            for(int idx=0;idx<orgFileList.size();idx++) {
	            	QaBoardFileDTO resetFile = orgFileList.get(idx);
	               if(del.equals(resetFile.getQafileName())) {//삭제할 파일명과 orgFileList에 있는 파일명이 같으면
	               orgFileList.remove(idx);
	               break;
	               }//if
	               }//for
	         }//for
	      }//if
	      //----
	      ModelAndView mav=new ModelAndView();
	      try {
	         //원 레코드 업데이트
	         int result = service.boardEdit(dto);
	         //파일목록 ->삭제, 추가
	         service.qaboardfileDelete(dto.getQaNo());
	         service.qaboardfileInsert(orgFileList);
	         //삭제한 파일을 /upload폴더에서 제거
	         if(dto.getDelFile()!=null) {
	            for(String delFilename:dto.getDelFile()) {
	               fileDelete(path, delFilename);
	            }//for
	         }//if
	         //글내용보기로 이동
	         mav.setViewName("redirect:qaBoardView?no="+dto.getQaNo());
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	         //새로업로드된 파일 삭제
	         for(QaBoardFileDTO fDTO: newFileList) {
	            fileDelete(path, fDTO.getQafileName());
	         }
	         //글내용수정
	         mav.setViewName("redirect:qaBoardEdit?no="+dto.getQaNo());
	      }
	      return mav;
	   }
	   
	   //자료실 글 삭제하기
	   @GetMapping("/boardDel")
	   public ModelAndView qaBoardDel(int no, HttpSession session) {
		   //파일 삭제시 경로 필요함
		   String path = session.getServletContext().getRealPath("/upload");
		   
		   //1. 삭제할 글의 첨부파일 선택 보관한다.
		   List<QaBoardFileDTO> fileList = service.qaboardfileSelect(no);
		   
		   //2. 첨부파일 레코드를 지운다.\
		   int delCount = service.qaboardfileDelete(no);
		   
		   //3. 원글(DB삭제)
			int result = service.boardDel(no, (String)session.getAttribute("logId"));
		   
		   //4. 첨부파일 삭제
		   for(QaBoardFileDTO dto : fileList) {
			   fileDelete(path, dto.getQafileName());
		   }
		   
		   //5. 삭제시 글 목록으로 이동
		   ModelAndView mav = new ModelAndView();
		   if(result>0) {
			   mav.setViewName("redirect:boardList");
		   }else{//	실패시 글 내용 보기
			   mav.setViewName("redirect:qaBoardView/"+no);
		   }
		   return mav;
	   }
	   
	   // 파일 삭제하는 메소드 ------------------------------
	   public void fileDelete(String path, String filename) {
	      try {
	         File f = new File(path, filename);
	         f.delete();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
}
}