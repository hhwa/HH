package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ContentAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));	//�� ��ȣ
		String pageNum = request.getParameter("pageNum");	//������ ��ȣ
		
		BoardDBBean dbPro = BoardDBBean.getInstance();	//DBó��
		BoardDataBean article = dbPro.getArticle(num);	//�ش� �۹�ȣ�� ���� ����Ʈ
		
		//�ش� �信�� ����� �Ӽ�
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		
		return "/MVC/content.jsp";
	}

}
