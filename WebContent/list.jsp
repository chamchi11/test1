<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="mybatis.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th,#bbs table td {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
	
	.empty{
		height: 60px;
	}
		
</style>
</head>
<body>
	<div id="bbs">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			
			<tfoot>
                      <tr>
                          <td colspan="4">
                              <ol class="paging">
<%
	Object obj1 = request.getAttribute("nowPage");
	int nowPage = (int)obj1;
	Object obj2 = request.getAttribute("pagePerBlock");
	int pagePerBlock =(int)obj2;
	Object obj3 = request.getAttribute("startPage");
	int startPage =(int)obj3;
	Object obj4 = request.getAttribute("endPage");
	int endPage =(int)obj4;
	Object obj5 = request.getAttribute("totalPage");
	int totalPage =(int)obj5;	
	
	if(startPage < pagePerBlock){
%>
	<li class="disable">&lt;</li> <%--이전버튼 --%>
<%		
	}else{
%>
	<li><a href="control?cPage=<%=nowPage-pagePerBlock%>">&lt;</a></li>
<%		
	}
	
	for(int i=startPage; i<=endPage; i++){
		
		if(nowPage == i){
			
		
%>
		<li class="now"><%=i %></li>
<%		
		}else{
%>
		<li><a href="control?cPage=<%=i%>"><%=i %></a></li>
<%			
		}//if문의 끝
	}//for문의 끝
	
	//다음 기능을 활성화 비활성화 시켜야 한다.
	//endPage가 totalPage보다 작을 경우에만 활성화!
	if(endPage < totalPage){
%>
	<li><a href="control?cPage=<%=nowPage+pagePerBlock%>">&gt;</a></li>
<%		
	}else{
%>
	<li class="disable">&gt;</li>
<%		
	}
%>
                              </ol>
                          </td>
						  <td>
						  </td>
                      </tr>
             </tfoot>
			<tbody>
<%
	//request

%>
			</tbody>
		</table>
		
	</div>			
</body>
</html>
















