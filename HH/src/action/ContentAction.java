package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));	//글 번호
		String pageNum = request.getParameter("pageNum");	//페이지 번호
		
		BoardDBBean dbPro = BoardDBBean.getInstance();	//DB처리
		BoardDataBean article = dbPro.getArticle(num);	//해당 글번호에 대한 리스트
		
		//해당 뷰에서 사용할 속성
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		
		return "/MVC/content.jsp";
	}

}
