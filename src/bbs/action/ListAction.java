package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BbsDAO;
import mybatis.vo.BbsVO;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 페이징 기법
		int nowPage = 1; //현재 페이지값 <----- 파라미터 cPage
		int numPerPage = 10; //한 페이지 당 보여질 게시물 수
		
		//페이징 기법에 필요한 변수들
		int totalRecord = BbsDAO.getTotalCount(); //총 게시물 수
		int pagePerBlock =3; //페이지 묶음(한 블럭당 보여질 페이지 수)
		int totalPage = 0; // 전체 페이지 수
		
		//전체 페이지 수 구하기
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		
		//파라미터로 현재 페이지 값이 있는지 받아본다.
		String cPage = request.getParameter("cPage");
		if(cPage != null){ //cPage값이 존재할때만 nowPage값을 cPage값으로 대체
			nowPage = Integer.parseInt(cPage);
		
			if(nowPage > totalPage)
				nowPage = totalPage;
		}
		
		//각 페이지 별 게시물을 선별하기 위한 범위(begin, end)를 지정
		int begin = (nowPage-1)*numPerPage+1;
		int end = begin+numPerPage-1;
		
		//현재 페이지 값에 의해 블럭의
		//시작 페이지 값을 구한다.
		int startPage =
		(nowPage-1)/pagePerBlock*pagePerBlock+1;
		
		//블럭의 마지막 페이지 값 구하기
		int endPage = startPage+pagePerBlock-1;
		
		//위에서 구해진 endPage가 총페이지보다 커지면 안된다
		if(endPage > totalPage)
			endPage = totalPage;
		
		BbsVO[] ar = BbsDAO.getList(begin, end);
		
		request.setAttribute("bbslist", ar);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		
		
		
		
		return "/list.jsp";
	}

}
