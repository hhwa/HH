package action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;

public class ListAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");
		String pageNum = request.getParameter("pageNum"); //페이지 번호
		String search = request.getParameter("search");
		
		int select=0;
		
		if(pageNum == null) {
			pageNum = "1";
		}
		if(search==null) {
			search="";
		}else {
			select = Integer.parseInt(request.getParameter("select"));
		}
		int pageSize = 10; //한페이지에서 보여줄 글의 갯수
		int currentPage = Integer.parseInt(pageNum); //현재페이지
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance(); //board DB 연동
		
		if(search.equals("")||search==null) {
			count = dbPro.getArticleCount(); //전체 글의 수
		}else {
			count = dbPro.getArticleCount(select, search); //전체 글의 수
		}
		
		
		if(count > 0) {
			if(search.equals("")||search==null) {
				articleList = dbPro.getArticles(startRow, endRow); //현재 페이지에 해당하는 글 목록
			}else {
				articleList = dbPro.getArticles(startRow, endRow, select, search); //현재 페이지에 해당하는 글 목록
			}
			
		}else {
			articleList = Collections.EMPTY_LIST;
		}
		
		number=count-(currentPage-1)*pageSize; //글 목록에 표시할 글 번호
		//해당 뷰에서 사용할 속성
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("search", new String(search));
		request.setAttribute("select", new Integer(select));
		request.setAttribute("articleList", articleList);
		
		return "/MVC/list.jsp"; //MVC/list.jsp로 이동
	}

}
