package action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.LogonDBBean;

public class ZipcheckFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");

		String check = request.getParameter("check");
		String area3 = request.getParameter("area3");
		LogonDBBean manager = LogonDBBean.getInstance();
		Vector zipcodeList = manager.zipcodeRead(area3);
		int totalList = zipcodeList.size();
		
		
		
		if(area3!=null) {
			request.setAttribute("check", new String(check));
			request.setAttribute("area3", new String(area3));
			request.setAttribute("manager", manager);
			request.setAttribute("zipcodeList", zipcodeList);
			request.setAttribute("totalList", new Integer(totalList));
		}
		
		
		
		return "/logon2/Zipcheck.jsp";
	}

}
