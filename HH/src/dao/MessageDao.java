package dao;

import java.sql.*;
import java.util.List;

import jdbc.JdbcUtil;
import model.Message;

public abstract class MessageDao {
	public abstract int insert(Connection conn, Message message) throws SQLException;
	
	public Message select(Connection conn,int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from guestbook_message_hh where message_id=?");
			pstmt.setInt(1, messageId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return makeMessageFromResultSet(rs);
			}else {
				return null;
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	protected Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		
		return message;
	}
	
	public int selectCount(Connection conn) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement("select count(*) from guestbook_message_hh");
			rs=pstmt.executeQuery();
			
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn,int theme_id) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement("select count(*) from guestbook_message_hh where theme_message_id=?");
			pstmt.setInt(1, theme_id);
			rs=pstmt.executeQuery();
			
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public abstract List<Message> selectList(Connection conn,int firstRow,int endRow) throws SQLException;
	public abstract List<Message> selectList(Connection conn,int firstRow,int endRow,int theme_id) throws SQLException;
	public int delete(Connection conn,int messageId) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			pstmt=conn.prepareStatement("delete from guestbook_message_hh where message_id=?");
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
}
