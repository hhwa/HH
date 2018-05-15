package board.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class IdGenerator {
	private static IdGenerator instance = new IdGenerator();
	public static IdGenerator getInstance() {
		return instance;
	}
	private IdGenerator() {
	}
	
	public int generateNextId(String sequenceName) throws IdGenerationFailedException{
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("select next_value from test_id_sequence where sequence_name =? for update");
			pstmt.setString(1, sequenceName);
			rs=pstmt.executeQuery();
			rs.next();
			int id=rs.getInt(1);
			id++;
			
			pstmt=conn.prepareStatement("update test_id_sequence set next_value=? where sequence_name=?");
			pstmt.setInt(1, id);
			pstmt.setString(2, sequenceName);
			pstmt.executeUpdate();
			
			conn.commit();
			
			return id;
		}catch(SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new IdGenerationFailedException(ex);
		}finally {
			if(conn!=null) {
				try {
					conn.setAutoCommit(true);
				}catch(SQLException e) {
				}
				JdbcUtil.close(conn);
			}
		}
	}
}
