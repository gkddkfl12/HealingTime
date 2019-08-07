package port.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.DB;
import port.dto.PortDTO;
import sqlmap.MybatisManager;

public class PortDAO {
	
	public List<PortDTO> portList() {
		List<PortDTO> items = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from pension order by name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PortDTO dto = new PortDTO();
				dto.setUserid2(rs.getString("userid2"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				items.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return items;
	}//memberList()

	public String loginCheck(PortDTO dto) {
		String result="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DB.getConn();
			String sql = 
					"select * from pension where userid2=? and passwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid2());
			pstmt.setString(2, dto.getPasswd());
			rs=pstmt.executeQuery();
			if(rs.next()) {//로그인 성공
				result=rs.getString("name")+"님 환영합니다.";
			}else {//로그인 실패
				result="로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}//end loginCheck()

	public void insert(PortDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into pension ");
			sql.append("(userid2,passwd,name,email,hp) values ");
			sql.append("(?,?,?,?,?)");
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid2());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getHp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//end insert()
	
	public PortDTO portDetail(String userid2) {
		PortDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql="select * from pension where userid2=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid2);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new PortDTO();
				dto.setUserid2(userid2);
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//finally
		return dto;
	}//end memberDetail()
	
	public void update(PortDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			StringBuilder sb=new StringBuilder();
			sb.append("update pension set ");
			sb.append(" passwd=?, name=?, email=?, hp=? ");
			sb.append(" where userid2=?");
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getUserid2());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}//end update


	public void delete(String userid2) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			String sql = "delete from pension where userid2=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid2);
			pstmt.executeUpdate();//레코드 삭제
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}//delete

	
	/*public void update(PortDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("port.update", dto);
		session.commit();//select가 아닌경우는 수동커밋
		session.close();
	}//updateMemo

	public void delete(String userid2) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("port.delete", userid2);
		session.commit();
		session.close();
	}//deleteMemo
*/
}
