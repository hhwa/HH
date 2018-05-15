package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.LogonDBBean;
import log.LogonDataBean;

public class LogonModifyProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");
		
		String id= request.getParameter("id");
		
		LogonDataBean member = new LogonDataBean();
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setBlog(request.getParameter("blog"));
		member.setZipcode(request.getParameter("zipcode"));
		member.setAddress(request.getParameter("address"));
		member.setAddress2(request.getParameter("address2"));
		member.setId(request.getParameter("id"));
		
		LogonDBBean dbPro = LogonDBBean.getInstance();
		dbPro.updateMember(member);
		
		return "/logon2/modifyPro.jsp";
	}

}
