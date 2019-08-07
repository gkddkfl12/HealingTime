package port;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import config.DB;
import port.dao.PortDAO;
import port.dto.PortDTO;



/**
 * Servlet implementation class PortController
 */
@WebServlet("/port_servlet/*")
public class PortController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
	IOException {
		
        String uri=request.getRequestURI();		
		//System.out.println(uri);	
		String context=request.getContextPath();
		PortDAO dao=new PortDAO();
		
		if(uri.indexOf("list.do") != -1) {
			System.out.println("list.do호출..");
			System.out.println(request.getRequestURI());
			System.out.println(uri.indexOf("list.do"));
			//HashMap 생성
			Map<String,Object> map=new HashMap<>();
			//dao의 memberList()호출 후 리턴받은 값을 list에 저장
			List<PortDTO> list=dao.portList();
			//DAO의 ArrayList에 담은 값들을 Map에 자료 저장
			map.put("list", list);
			//ArrayList에 담겨진 레코드의 갯수를 저장
			map.put("count", list.size());
			
			//최종적으로 map에 담긴값을 setAttribute에 저장
			request.setAttribute("map", map);//key,value
			//출력을 위해 포워딩할 uri지정
			String page="/pension/portList.jsp";
			/*String page="/ch08/member_list2.jsp";*/
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);//포워딩
		}
		
		
		
		if(uri.indexOf("login.do") != -1){//로그인 처리
			String userid2=request.getParameter("userid2");
			String passwd=request.getParameter("passwd");
			PortDTO dto=new PortDTO();
			dto.setUserid2(userid2);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			System.out.println(result);
			String page="/pension/pension_login.jsp";
			
			
			
			if(!result.equals("로그인 실패")) {//로그인 성공시
				//세션 객체 생성
				HttpSession session=request.getSession();
				//세션에 값을 저장
				session.setAttribute("userid2", userid2);
				session.setAttribute("message", result);
				page="/pension/index.jsp";
				response.sendRedirect(request.getContextPath()+page+"?message=login");
				
			}else {//로그인 실패
				response.sendRedirect(
						request.getContextPath()+page+"?message=error3");
			      }
			
			
			}else if(uri.indexOf("logout.do") != -1) {//로그아웃 처리
				HttpSession session=request.getSession();
				//세션을 비움(초기화시킴)
				session.invalidate();
				//로그인 페이지로 이동
				String page=request.getContextPath()
						+"/pension/index.jsp?message=logout3";
				response.sendRedirect(page);
				
						
			}else if(uri.indexOf("join.do") != -1) {//회원등록
				String userid2=request.getParameter("userid2");
				String passwd=request.getParameter("passwd");
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String hp=request.getParameter("hp");
				PortDTO dto=new PortDTO();//PortDTO생성
				dto.setUserid2(userid2);				dto.setPasswd(passwd);
				dto.setName(name);
				dto.setEmail(email);
				dto.setHp(hp);
				dao.insert(dto);//추가
				String page=request.getContextPath()+"/pension/pension_login.jsp";
				response.sendRedirect(page);
				
				
				
			}else if(uri.indexOf("view.do") != -1) {
				String userid2=request.getParameter("userid2");
				System.out.println("클릭한 아이디:"+userid2);
				PortDTO dto=dao.portDetail(userid2);
				request.setAttribute("dto", dto);
				String page="/pension/연습1.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
				
			}else if(uri.indexOf("update.do") != -1) {
				String userid2=request.getParameter("userid2");
				String passwd=request.getParameter("passwd");
				String name=request.getParameter("name");
				String email=request.getParameter("email");
				String hp=request.getParameter("hp");
				PortDTO dto=new PortDTO();
				dto.setUserid2(userid2);
				dto.setPasswd(passwd);
				dto.setName(name);
				dto.setEmail(email);
				dto.setHp(hp);
				dao.update(dto);//레코드 수정
				//페이지 이동
				/*response.sendRedirect(
						request.getContextPath()+"/pension/pension_login.jsp");*/
				response.sendRedirect(context+"/pension/pension_login.jsp");
			
				
			}else if(uri.indexOf("delete.do") != -1) {
				String userid2=request.getParameter("userid2");
				//레코드 삭제
				dao.delete(userid2);
				//페이지 이동
				response.sendRedirect(context+"/pension/pension_login.jsp");
			}
				
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
