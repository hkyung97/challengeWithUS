<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/super-build/ckeditor.js"></script>
<script src="/home/inc/ckeditor.js"></script>
 <style>
       .ck-editor__editable[role="textbox"] {
                /* editing area */
           		min-height: 200px;
            }
        .ck-content .image {
                /* block images */
                max-width: 80%;
                margin: 20px auto;
            }
         #filelist b{
         	cursor:pointer;
 </style>
  <script>
 	// document가 로딩이 완료 되면 ready 이벤트에 의해서 호출된다.
 	//ready 이벤트
// 	jQuery(function(){
 			
// 	});
// 	jQuery(function(){
 		
// 	});
 	$(function(){  //ready이벤트
 		//$(선택자).함수(funcion(){
 			//실행문
 	//});
 		//선택자          이벤트       선택자
 		$(document).on('click','#frm input[value=" + "]',function(){
 			//파일 첨부 input을 추가
 			var tag = "<div><input type='file' name='filename'/>";
 			tag += "<input type='button' value=' + '/></div>";
 			//현재 내용의 마지막에 추가
 			$("#filelist").append(tag);
 			
 			//방금 이벤트가 발생한 + -> -로 변경한다.
 			$(this).val(' - ');
 			$(this).parent().css("background","yellow");
 		});
 		
 		$(document).on('click','#frm input[value=" - "]',function(){
 			$(this).parent().remove();
 		});
 		
 		//수정시 파일 삭제를 할 경우 파일명은 화면에서 숨기고
 		//hidden input은 name속성을 설정한다.
 		$("#filelist b").click(function(){
 			$(this).parent().css("display","none"); //삭제된 파일명 숨기기
 			//삭제된 파일명을 가진 input을 name 속성 설정하기
 			//html 속성 바꾸기: attr()->속성&값, prop()->속성만
 			//name = "name"   checked, readonly, selected....
 			$(this).parent().next().attr("name", "delFile");
 		});
 		
 	});
 </script>
<main>
	<h1>게시판 글수정</h1>
	<form method="post" id="frm" action="/home/board/qaBoardEditOk" enctype="multipart/form-data">
	<!-- 현재 수정 글의 글 번호를 폼에 보관... 수정 기준이 되는 레코드 번호로 사용 -->
	<input type = "hidden" name = "qaNo" value = "${dto.qaNo }"/>
	<ul>
		<li>제목</li>
		<li><input type = "text" name = "qaTitle" id = "qaTitle"  value = "${dto.qaTitle }"/></li>
		<li>글내용</li>
		<li><textarea name = qaContent id = "qaContent">${dto.qaContent }</textarea></li>
		<li>첨부파일</li>
		<li id='filelist'>	
		
			<!-- 이미 첨부된 파일을 다시 수정 할 수 있도록 해준다 -->	
			<c:forEach var = "QaBoardfileDTO" items = "${fileList}">
				<div>${QaBoardfileDTO.qafileName} <b>X</b></div>
				<input type = "hidden" name="" value="${QaBoardfileDTO.qafileName }"/>
			</c:forEach>
			
			<div>
				<input type="file" name="qafileName" id="qafileName"/>
				<input type="button" value=" + "/>
			</div>
		</li>
		<li><input type="submit" value="글수정하기"/></li>

	</ul>
	</form>
</main>

<script>
CKEDITOR.ClassicEditor.create(document.getElementById("qaContent"),option);
</script>