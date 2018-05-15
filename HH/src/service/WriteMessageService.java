package service;

import java.sql.*;

import dao.MessageDao;
import dao.MessageDaoProvider;
import model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService instance=new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return instance;
	}
	private WriteMessageService() {}
	
	public void write(Message message) throws ServiceException {
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDaoProvider.getInstnace().getMessageDao();
			messageDao.insert(conn, message);
		}catch(SQLException e) {
			throw new ServiceException("메세지 등록 실패 : "+e.getMessage(), e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
