package pds.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import pds.dao.PdsItemDao;
import pds.model.PdsItem;

public class DeletePdsItemService {

	private static DeletePdsItemService instance = new DeletePdsItemService();
	public static DeletePdsItemService getInstance() {
		return instance;
	}
	private DeletePdsItemService() {}
	
	public void deletePdsItem(int pdsItemId) {
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			PdsItemDao pdsItemDao = PdsItemDao.getInstance();
			pdsItemDao.delete(conn, pdsItemId);
		}catch(SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
