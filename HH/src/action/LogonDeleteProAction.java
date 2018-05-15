package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.LogonDBBean;

public class LogonDeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");
		
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		
		LogonDBBean dbPro = LogonDBBean.getInstance();
		int check = dbPro.deleteMember(id, passwd);
		
		request.setAttribute("check", new Integer(check));		
		return "/logon2/deletePro.jsp";
	}

}
