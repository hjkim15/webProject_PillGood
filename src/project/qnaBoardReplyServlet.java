package project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/project/qnaBoardReply")
public class qnaBoardReplyServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		qnaBoardMgr qMgr = new qnaBoardMgr();
		qnaBoardBean qBean = new qnaBoardBean();
		qBean.setNickname(request.getParameter("nickname"));
		qBean.setSubject(request.getParameter("subject"));
		qBean.setContent(request.getParameter("content"));
		qBean.setRef(Integer.parseInt(request.getParameter("ref"))); 
		qBean.setPos(Integer.parseInt(request.getParameter("pos"))); 
		qBean.setDepth(Integer.parseInt(request.getParameter("depth"))); 
		qBean.setPass(request.getParameter("pass"));
		qBean.setIp(request.getParameter("ip"));

		qMgr.replyUpBoard(qBean.getRef(), qBean.getPos());
		qMgr.replyBoard(qBean);
		
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("qnaList.jsp?nowPage="+nowPage);
	}
}