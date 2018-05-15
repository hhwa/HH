package board;

import java.sql.*;
import java.util.*;

import jdbc.JdbcUtil;
public class CommentDBBean {

	private static CommentDBBean instance = new CommentDBBean();
	
	public static CommentDBBean getInstance() {
		return instance;
	}
	private CommentDBBean() {}
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:/pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	public void insertComment(CommentDataBean cdb) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		int cntnum = cdb.getContent_num();
		int cmtnum = cdb.getComment_num();
		int cm_ref = cdb.getCm_ref();
		int cm_re_step = cdb.getCm_re_step();
		int cm_re_level = cdb.getCm_re_level();
		int number = 0;
		String sql = "";
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(comment_num) from test_board_comment");
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			if (cntnum != 0) {
				sql = "update test_board_comment set cm_re_step=cm_re_step+1 where cm_ref=? and cm_re_step>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cm_ref);
				pstmt.setInt(2, cm_re_step);
				pstmt.executeQuery();
				cm_re_step += 1;
				cm_re_level += 1;
			} else {
				cm_ref = number;
				cm_re_step = 0;
				cm_re_level = 0;
			}

			sql="insert into test_board_comment values (?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cdb.getContent_num());
			pstmt.setString(2, cdb.getCommenter());
			pstmt.setString(3, cdb.getCommentt());
			pstmt.setString(4, cdb.getPasswd());
			pstmt.setTimestamp(5, cdb.getReg_date());
			pstmt.setString(6, cdb.getIp());
			pstmt.setInt(7,cdb.getComment_num());
			pstmt.setInt(8, cm_ref);
			pstmt.setInt(9, cm_re_step);
			pstmt.setInt(10, cm_re_level);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}
	
	public ArrayList getComments(int con_num,int start,int end) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		ArrayList cm=null;
		
		try {
			conn=getConnection();
			String sql="select content_num,commenter,commentt,reg_date,ip,comment_num, r "
					+ "from (select content_num,commenter,commentt,reg_date,ip,comment_num,rownum r "
					+ "from (select content_num,commenter,commentt,reg_date,ip,comment_num "
					+ "from test_board_comment where content_num="+con_num+" order by reg_date desc) order by reg_date desc) where r>=? and r<=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cm=new ArrayList();
				do {
					CommentDataBean cdb = new CommentDataBean();
					cdb.setComment_num(rs.getInt("comment_num"));
					cdb.setContent_num(rs.getInt("content_num"));
					cdb.setCommenter(rs.getString("commenter"));
					cdb.setCommentt(rs.getString("commentt"));
					cdb.setIp(rs.getString("ip"));
					cdb.setReg_date(rs.getTimestamp("reg_date"));
					cm.add(cdb);
				}while(rs.next());
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return cm;
	}
	public CommentDataBean getComment(int cntnum,int cmtnum) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentDataBean cmt = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from test_board_comment where content_num=? and comment_num=?");
			pstmt.setInt(1, cntnum);
			pstmt.setInt(2, cmtnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cmt = new CommentDataBean();
				cmt.setComment_num(rs.getInt("comment_num"));
				cmt.setContent_num(rs.getInt("content_num"));
				cmt.setCommenter(rs.getString("commenter"));
				cmt.setCommentt(rs.getString("commentt"));
				cmt.setPasswd(rs.getString("passwd"));
				cmt.setReg_date(rs.getTimestamp("reg_date"));
				cmt.setIp(rs.getString("ip"));
			
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return cmt;
	}
	
	public int getCommentCount(int con_num) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		ArrayList cm=null;
		int count=0;
		
		try {
			conn=getConnection();
			String sql="select * from test_board_comment where content_num="+con_num+" order by reg_date desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cm=new ArrayList();
				do {
					CommentDataBean cdb=new CommentDataBean();
					cdb.setCommenter(rs.getString("commenter"));
					cdb.setCommentt(rs.getString("commentt"));
					cdb.setIp(rs.getString("ip"));
					cdb.setReg_date(rs.getTimestamp("reg_date"));
					cm.add(cdb);
				}while(rs.next());
				count=cm.size();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return count;
	}
	
	public int deleteComment(int content_num,String passwd,int comment_num) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbpasswd="";
		int x=-1;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select passwd from test_board_comment where content_num=? and comment_num=?");
			pstmt.setInt(1, content_num);
			pstmt.setInt(2, comment_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					pstmt=conn.prepareStatement("delete from test_board_comment where content_num=? and comment_num=?");
					pstmt.setInt(1, content_num);
					pstmt.setInt(2, comment_num);
					pstmt.executeUpdate();
					x=1;
				}else
					x=0;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return x;
	}
}
