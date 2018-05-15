package imageboard.sequence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;

public class Sequencer {
	
	public synchronized static int nextId(Connection conn,String tableName) throws SQLException {
		PreparedStatement pstmtSelect = null;
		ResultSet rs= null;
		
		PreparedStatement pstmtUpdate = null;
		
		try {
			pstmtSelect = conn.prepareStatement("select message_id from test_id_sequences where table_name = ?");
			pstmtSelect.setString(1, tableName);
			
			rs = pstmtSelect.executeQuery();
			
			if(rs.next()) {
				int id=rs.getInt(1);
				id++;
				
				pstmtUpdate = conn.prepareStatement("update test_id_sequences set message_id = ? where table_name = ?");
				pstmtUpdate.setInt(1, id);
				pstmtUpdate.setString(2, tableName);
				pstmtUpdate.executeUpdate();
				
				return id;
			}else {
				pstmtUpdate = conn.prepareStatement("insert into test_id_sequences values (?, ?)");
				pstmtUpdate.setString(1, tableName);
				pstmtUpdate.setInt(2, 1);
				pstmtUpdate.executeUpdate();
				
				return 1;		
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmtSelect);
			JdbcUtil.close(pstmtUpdate);
		}
		
	}

}
