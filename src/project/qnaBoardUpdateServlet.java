package project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/project/qnaBoardUpdate")
public class qnaBoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		qnaBoardMgr qMgr = new qnaBoardMgr();
		qnaBoardBean bean = (qnaBoardBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		qnaBoardBean upBean = new qnaBoardBean();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		upBean.setNickname(request.getParameter("nickname"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		upBean.setIp(request.getParameter("ip"));

		String upPass = upBean.getPass();
		String inPass = bean.getPass();

		if (upPass.equals(inPass)) {
			qMgr.updateBoard(upBean);
			String url = "qnaRead.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}