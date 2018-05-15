package imageboard.gallery;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import imageboard.sequence.Sequencer;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ThemeManager {

	private static ThemeManager instance = new ThemeManager();

	public static ThemeManager getInstance() {
		return instance;
	}

	private ThemeManager() {
	}

	public int cmtCount(int messageId) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		try {
			conn=ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement("select count(*) from test_theme_comment");
			
			rs=pstmt.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		}catch(SQLException e) {
			e.printStackTrace();
			throw new Exception("cmtCount",e);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}
	
	public void cmtInsert(Theme theme) throws Exception {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn=ConnectionProvider.getConnection();
			
			pstmt=conn.prepareStatement("insert into test_theme_comment values (?,?,?,?,?,?)");
			pstmt.setInt(1, theme.getComment_num());
			pstmt.setString(2, theme.getWriter());
			pstmt.setString(3, theme.getCmtpassword());
			pstmt.setString(4, theme.getComment());
			pstmt.setInt(5, theme.getId());
			pstmt.setTimestamp(6, theme.getRegister());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
	}

	public ArrayList cmtSelectList(int messageId,int start,int end) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList cm=null;
		try {
			conn = ConnectionProvider.getConnection();
			
			pstmt= conn.prepareStatement("select * from test_theme_comment where theme_content_id=?");
			pstmt.setInt(1, messageId);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cm = new ArrayList();
				do {
					Theme theme=new Theme();
					theme.setComment_num(rs.getInt("message_id"));
					theme.setWriter(rs.getString("writer"));
					theme.setCmtpassword(rs.getString("password"));
					theme.setComment(rs.getString("theme_comment"));
					theme.setId(rs.getInt("theme_content_id"));
					theme.setRegister(rs.getTimestamp("reg_date"));
					cm.add(theme);
					
				}while(rs.next());
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return cm;		
	}
	public void insert(Theme theme) throws Exception {
		Connection conn = null;
		// 새로운 글의 그룹 번호 구할때 사용
		Statement stmtGroup = null;
		ResultSet rsGroup = null;
		// 특정 글의 답글에 대한 출력 순서 구할때 사용
		PreparedStatement pstmtOrder = null;
		ResultSet rsOrder = null;
		PreparedStatement pstmtOrderUpdate = null;
		// 글을 삽입할 때 사용
		PreparedStatement pstmtInsertMessage = null;
		PreparedStatement pstmtInsertContent = null;

		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			if (theme.getParentId() == 0) {
				// 답글이 아닌 경우 그룹번호를 새롭게 구한다.
				stmtGroup = conn.createStatement();
				rsGroup = stmtGroup.executeQuery("select max(group_id) from test_theme_message");
				int maxGroupId = 0;
				if (rsGroup.next()) {
					maxGroupId = rsGroup.getInt(1);
				}
				maxGroupId++;

				theme.setGroupId(maxGroupId);
				theme.setOrderNo(0);
			} else {
				// 특정 글의 답글인 경우, 같은 그룹 번호 내에서 출력 순서를 구한다.
				pstmtOrder = conn.prepareStatement(
						"select max(order_no) from test_theme_message where parent_id = ? or theme_message_id = ?");
				pstmtOrder.setInt(1, theme.getParentId());
				pstmtOrder.setInt(2, theme.getParentId());
				rsOrder = pstmtOrder.executeQuery();
				int maxOrder = 0;
				if (rsOrder.next()) {
					maxOrder = rsOrder.getInt(1);
				}
				maxOrder++;
				theme.setOrderNo(maxOrder);
			}

			// 특정 글의 답변 글인 경우 같은 그룹 내에서 순서번호를 변경한다.
			if (theme.getOrderNo() > 0) { // 답변글이 존재할경우
				pstmtOrderUpdate = conn.prepareStatement(
						"update test_theme_message set order_no = order_no + 1 where group_id = ? and order_no >= ?");
				pstmtOrderUpdate.setInt(1, theme.getGroupId());
				pstmtOrderUpdate.setInt(2, theme.getOrderNo());
				pstmtOrderUpdate.executeUpdate();
			}
			// 새로운 글의 번호를 구한다.
			theme.setId(Sequencer.nextId(conn, "test_theme_message"));
			pstmtInsertMessage = conn.prepareStatement("insert into test_Theme_message values (?,?,?,?,?,?,?,?,?,?,?)");
			pstmtInsertMessage.setInt(1, theme.getId());
			pstmtInsertMessage.setInt(2, theme.getGroupId());
			pstmtInsertMessage.setInt(3, theme.getOrderNo());
			pstmtInsertMessage.setInt(4, theme.getLevels());
			pstmtInsertMessage.setInt(5, theme.getParentId());
			pstmtInsertMessage.setTimestamp(6, theme.getRegister());
			pstmtInsertMessage.setString(7, theme.getName());
			pstmtInsertMessage.setString(8, theme.getEmail());
			pstmtInsertMessage.setString(9, theme.getImage());
			pstmtInsertMessage.setString(10, theme.getPassword());
			pstmtInsertMessage.setString(11, theme.getTitle());
			pstmtInsertMessage.executeUpdate();
			
			pstmtInsertContent = conn.prepareStatement("insert into test_theme_content values (?,?)");
			pstmtInsertContent.setInt(1, theme.getId());
			pstmtInsertContent.setCharacterStream(2, new StringReader(theme.getContent()),theme.getContent().length());
			pstmtInsertContent.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new Exception("insert",e);
		}finally {
			JdbcUtil.close(rsGroup);
			JdbcUtil.close(stmtGroup);
			JdbcUtil.close(rsOrder);
			JdbcUtil.close(pstmtOrder);
			JdbcUtil.close(pstmtOrderUpdate);
			JdbcUtil.close(pstmtInsertMessage);
			JdbcUtil.close(pstmtInsertContent);
			
			conn.setAutoCommit(true);
			JdbcUtil.close(conn);
		}
	}
	
	//제목과 내용만 변경
	public void update(Theme theme) throws Exception {
		Connection conn=null;
		PreparedStatement pstmtUpdateMessage = null;
		PreparedStatement pstmtUpdateContent = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			pstmtUpdateMessage = conn.prepareStatement("update test_theme_message set name=?,email=?,image=?,title=? where theme_message_id=?");
			pstmtUpdateContent = conn.prepareStatement("update test_theme_content set content=? where theme_message_id=?");
			
			pstmtUpdateMessage.setString(1, theme.getName());
			pstmtUpdateMessage.setString(2, theme.getEmail());
			pstmtUpdateMessage.setString(3, theme.getImage());
			pstmtUpdateMessage.setString(4, theme.getTitle());
			pstmtUpdateMessage.setInt(5, theme.getId());
			pstmtUpdateMessage.executeUpdate();
			
			pstmtUpdateContent.setCharacterStream(1, new StringReader(theme.getContent()),theme.getContent().length());
			pstmtUpdateContent.setInt(2, theme.getId());
			pstmtUpdateContent.executeUpdate();
			
			conn.commit();
		}catch(SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new Exception("update",e);
		}finally {
			JdbcUtil.close(pstmtUpdateMessage);
			JdbcUtil.close(pstmtUpdateContent);
			
			conn.setAutoCommit(true);
			JdbcUtil.close(conn);
		}
	}
	
	//등록된 글의 갯수를 구한다.
	public int count(List whereCond,Map valueMap) throws Exception {
		if(valueMap == null) valueMap = Collections.EMPTY_MAP;
		
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		try {
			conn=ConnectionProvider.getConnection();
			StringBuffer query = new StringBuffer(200);
			query.append("select count(*) from test_theme_message ");
			if(whereCond != null && whereCond.size() >0) {
				query.append("where ");
				for(int i=0; i<whereCond.size(); i++) {
					query.append(whereCond.get(i));
					if(i<whereCond.size()-1) {
						query.append(" or ");
					}
				}
			}
			pstmt=conn.prepareStatement(query.toString());
			
			Iterator keyIter = valueMap.keySet().iterator();
			while(keyIter.hasNext()) {
				Integer key = (Integer)keyIter.next();
				Object obj = valueMap.get(key);
				if(obj instanceof String) {
					pstmt.setString(key.intValue(), (String)obj);
				}else if(obj instanceof Integer) {
					pstmt.setInt(key.intValue(), ((Integer)obj).intValue());
				}else if(obj instanceof Timestamp) {
					pstmt.setTimestamp(key.intValue(), (Timestamp)obj);
				}
			}
			
			rs=pstmt.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		}catch(SQLException e) {
			e.printStackTrace();
			throw new Exception("count",e);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
	}
	
	//목록을 읽어온다
	public List selectList(List whereCond, Map valueMap,int startRow,int endRow) throws Exception {
		if(valueMap == null) valueMap =Collections.EMPTY_MAP;
		
		Connection conn=null;
		PreparedStatement pstmtMessage = null;
		ResultSet rsMessage = null;
		
		try {
			StringBuffer query = new StringBuffer(200);
			
			query.append("select * from (select theme_message_id,group_id,order_no,levels,parent_id,register,name,email,image,password,title,rownum rnum ");
			query.append(" from ( select theme_message_id,group_id,order_no,levels,parent_id,register,name,email,image,password,title from test_theme_message ");
			if(whereCond !=null && whereCond.size() > 0) {
				query.append("where ");
				for(int i=0; i<whereCond.size(); i++) {
					query.append(whereCond.get(i));
					if(i<whereCond.size()-1) {
						query.append(" or ");
					}
				}
			}
			query.append(" order by group_id desc,order_no asc) where rownum <=? ) where rnum >= ?");
			
			conn = ConnectionProvider.getConnection();
			
			pstmtMessage = conn.prepareStatement(query.toString());
			Iterator keyIter = valueMap.keySet().iterator();
			while(keyIter.hasNext()) {
				Integer key = (Integer)keyIter.next();
				Object obj = valueMap.get(key);
				if(obj instanceof String) {
					pstmtMessage.setString(key.intValue(), (String)obj);
				}else if(obj instanceof Integer) {
					pstmtMessage.setInt(key.intValue(), ((Integer)obj).intValue());
				}else if(obj instanceof Timestamp) {
					pstmtMessage.setTimestamp(key.intValue(), (Timestamp)obj);
				}
			}
			pstmtMessage.setInt(valueMap.size()+1, endRow+1);
			pstmtMessage.setInt(valueMap.size()+2, startRow+1);
			
			rsMessage = pstmtMessage.executeQuery();
			if(rsMessage.next()) {
				List list = new java.util.ArrayList(endRow-startRow+1);
				
				do {
					Theme theme = new Theme();
					theme.setId(rsMessage.getInt("theme_message_id"));
					theme.setGroupId(rsMessage.getInt("group_id"));
					theme.setOrderNo(rsMessage.getInt("order_no"));
					theme.setLevels(rsMessage.getInt("levels"));
					theme.setParentId(rsMessage.getInt("parent_id"));
					theme.setRegister(rsMessage.getTimestamp("register"));
					theme.setName(rsMessage.getString("name"));
					theme.setEmail(rsMessage.getString("email"));
					theme.setImage(rsMessage.getString("image"));
					theme.setPassword(rsMessage.getString("password"));
					theme.setTitle(rsMessage.getString("title"));
					list.add(theme);
				} while(rsMessage.next());
				
				return list;
			}else {
				return Collections.EMPTY_LIST;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			throw new Exception("selectList",e);
		}finally {
			JdbcUtil.close(rsMessage);
			JdbcUtil.close(pstmtMessage);
			JdbcUtil.close(conn);
		}
	}
	
	//지정한 글을 읽어온다.
	public Theme select(int id) throws Exception {
		Connection conn=null;
		PreparedStatement pstmtMessage = null;
		ResultSet rsMessage = null;
		PreparedStatement pstmtContent = null;
		ResultSet rsContent=null;
		
		try {
			Theme theme=null;
			
			conn=ConnectionProvider.getConnection();
			pstmtMessage = conn.prepareStatement("select * from test_theme_message where theme_message_id=?");
			pstmtMessage.setInt(1, id);
			rsMessage=pstmtMessage.executeQuery();
			if(rsMessage.next()) {
				theme = new Theme();
				theme.setId(rsMessage.getInt("theme_message_id"));
				theme.setGroupId(rsMessage.getInt("group_id"));
				theme.setOrderNo(rsMessage.getInt("order_no"));
				theme.setLevels(rsMessage.getInt("levels"));
				theme.setParentId(rsMessage.getInt("parent_id"));
				theme.setRegister(rsMessage.getTimestamp("register"));
				theme.setName(rsMessage.getString("name"));
				theme.setEmail(rsMessage.getString("email"));
				theme.setImage(rsMessage.getString("image"));
				theme.setPassword(rsMessage.getString("password"));
				theme.setTitle(rsMessage.getString("title"));
				
				pstmtContent = conn.prepareStatement("select content from test_theme_content where theme_message_id =?");
				pstmtContent.setInt(1, id);
				rsContent=pstmtContent.executeQuery();
				if(rsContent.next()) {
					Reader reader = null;
					try {
						reader = rsContent.getCharacterStream("content");
						char[] buff = new char[512];
						int len = -1;
						StringBuffer buffer = new StringBuffer(512);
						while( (len =reader.read(buff)) != -1) {
							buffer.append(buff,0,len);
						}
						theme.setContent(buffer.toString());
					}catch(IOException ie) {
						throw new Exception("select", ie);
					}finally {
						if(reader != null)
							try {
								reader.close();
							}catch(IOException ie) {}
					}
				}else {
					return null;
				}
				return theme;
			}else {
				return null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			throw new Exception("select",e);
		}finally {
			JdbcUtil.close(rsMessage);
			JdbcUtil.close(pstmtMessage);
			JdbcUtil.close(rsContent);
			JdbcUtil.close(pstmtContent);
			JdbcUtil.close(conn);
		}
	}
	
	public void delete(int id) throws Exception {
		Connection conn=null;
		PreparedStatement pstmtMessage = null;
		PreparedStatement pstmtContent = null;
		
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			pstmtMessage = conn.prepareStatement("delete from test_theme_message where theme_message_id=?");
			pstmtContent = conn.prepareStatement("delete from test_theme_content where theme_message_id=?");
			
			pstmtMessage.setInt(1, id);
			pstmtContent.setInt(1, id);
			
			int updatedCount1 = pstmtMessage.executeUpdate();
			int updatedCount2 = pstmtContent.executeUpdate();
			
			if(updatedCount1 + updatedCount2 == 2) {
				conn.commit();
			}else {
				conn.rollback();
				throw new Exception("invalid id : "+id);
			}
		}catch(SQLException ex) {
			ex.printStackTrace();
			JdbcUtil.rollback(conn);
			throw new Exception("delete",ex);
		}finally {
			JdbcUtil.close(pstmtMessage);
			JdbcUtil.close(pstmtContent);
			conn.setAutoCommit(true);
			JdbcUtil.close(conn);
		}
	}
}
