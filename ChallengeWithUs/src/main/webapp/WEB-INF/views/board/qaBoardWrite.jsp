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
 </style>
  <script>
 	// document가 로딩이 완료 되면 ready 이벤트에 의해서 호출된다.
 	//ready 이벤트
// 	jQuery(function(){
 			
// 	});
// 	jQuery(function(){
 		
// 	});
 	$(function(){  //ready이벤트
 		//$(선택자(style sheet)).함수(funcion(){
 			//실행문
 	//});
 		//선택자(js에 있는 document)이벤트       선택자
 		$(document).on('click','#frm input[value=" + "]',function(){
 			//파일 첨부 input을 추가
 			var tag = "<div><input type='file' name='qafileName'/>";
 			tag += "<input type='button' value=' + '/></div>";
 			//현재 내용의 마지막에 추가
 			$("#qafilelist").append(tag);
 			
 			//방금 이벤트가 발생한 + -> -로 변경한다.
 			$(this).val(' - ');
 			$(this).parent().css("background","yellow");
 		});
 		
 		$(document).on('click','#frm input[value=" - "]',function(){
 			$(this).parent().remove();
 		});
 	});
 </script>
 
<main>
	<h1>QA 게시판</h1>
	<form method="post" id="frm" action="/home/board/boardWriteOk" enctype="multipart/form-data">
	<ul>
		<li>제목</li>
		<li><input type = "text" name = "qaTitle" id = "qaTitle"/></li>
		<li>글내용</li>
		<li><textarea name = qaContent id = "qaContent"></textarea></li>
		<li>첨부파일</li>
		<li id='qafilelist'>		
			<div>
				<input type="file" name="qafileName" id="qafileName"/>
				<input type="button" value=" + "/>
			</div>
		</li>
		<li><input type="submit" value="글등록"/></li>

	</ul>
	</form>
</main>
<script>
		CKEDITOR.ClassicEditor.create(document.getElementById("qaContent"),option);
</script>