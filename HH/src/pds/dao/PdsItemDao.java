package pds.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import pds.model.PdsItem;

public class PdsItemDao {

	private static PdsItemDao instance = new PdsItemDao();
	public static PdsItemDao getInstance () {
		return instance;
	}
	private PdsItemDao () {}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt=null;
		ResultSet rs= null;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery("select count(*) from test_pds_item");
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}

	}
	public List<PdsItem> select(Connection conn,int firstRow,int endRow) throws SQLException{
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			pstmt=conn.prepareStatement("select pds_item_id,filename,realpath,filesize,downloadcount,description "
					+ "from (select rownum rnum,pds_item_id,filename,realpath,filesize,downloadcount,description "
					+ "from (select * from test_pds_item m order by m.pds_item_id desc ) where rownum <=?) where rnum >= ?");
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs=pstmt.executeQuery();
			if(!rs.next()) {
				return Collections.emptyList();
			}
			List<PdsItem> pdsItemList=new ArrayList<PdsItem>();
			do {
				PdsItem pdsItem = makePdsItemFromResultSet(rs,false);
				pdsItemList.add(pdsItem);
			}while(rs.next());
			return pdsItemList;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	private PdsItem makePdsItemFromResultSet(ResultSet rs,boolean readContent) throws SQLException {
		PdsItem pdsItem = new PdsItem();
		pdsItem.setId(rs.getInt("pds_item_id"));
		pdsItem.setFileName(rs.getString("filename"));
		pdsItem.setRealPath(rs.getString("realpath"));
		pdsItem.setFileSize(rs.getLong("filesize"));
		pdsItem.setDownloadCount(rs.getInt("downloadcount"));
		pdsItem.setDescription(rs.getString("description"));
		
		return pdsItem;
	}
	
	public PdsItem selectById(Connection conn,int pdsItemId) throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			pstmt = conn.prepareStatement("select * from test_pds_item where pds_item_id=?");
			pstmt.setInt(1, pdsItemId);
			rs=pstmt.executeQuery();
			if(!rs.next()) {
				return null;
			}
			PdsItem pdsItem = makePdsItemFromResultSet(rs,true);
			return pdsItem;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	public int increaseDownloadCount(Connection conn,int pdsItemId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update test_pds_item set downloadcount = downloadcount+1 where pds_item_id =?");
			pstmt.setInt(1, pdsItemId);
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	public int insert(Connection conn,PdsItem item) throws SQLException {
		PreparedStatement pstmt=null;
		Statement stmt=null;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement("insert into test_pds_item (pds_item_id,filename,realpath,filesize,downloadcount,description) values (test_pds_item_id_seq.nextval,?,?,?,0,?)");
			pstmt.setString(1, item.getFileName());
			pstmt.setString(2, item.getRealPath());
			pstmt.setLong(3, item.getFileSize());
			pstmt.setString(4, item.getDescription());
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount >0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select test_pds_item_id_seq.CURRVAL from dual");
				if(rs.next()) {
					return rs.getInt(1);
				}
			}
			return -1;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
		}
	}
	public void delete(Connection conn,int pdsItemId) throws SQLException {
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement("delete from test_pds_item where pds_item_id= ?");
			pstmt.setInt(1, pdsItemId);
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
}
