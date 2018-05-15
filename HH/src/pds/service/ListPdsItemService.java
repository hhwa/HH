package pds.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import board.model.ArticleListModel;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import pds.dao.PdsItemDao;
import pds.model.PdsItem;
import pds.model.PdsItemListModel;

public class ListPdsItemService {

	private static ListPdsItemService instance = new ListPdsItemService();
	public static ListPdsItemService getInstance () {
		return instance;
	}
	private ListPdsItemService() {
	}

	public static final int COUNT_PER_PAGE = 10;
	public PdsItemListModel getPdsItemList(int requestPageNumber) {
		if(requestPageNumber<0) {
			throw new IllegalArgumentException("page number < 0 :"+requestPageNumber);
		}
		PdsItemDao pdsItemDao = PdsItemDao.getInstance();
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			int totalPdsItemCount = pdsItemDao.selectCount(conn);
			
			if(totalPdsItemCount==0) {
				return new PdsItemListModel();
			}
			int totalPageCount = calculateTotalPageCount(totalPdsItemCount);
			
			int firstRow = (requestPageNumber - 1)*COUNT_PER_PAGE +1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;
			
			if(endRow > totalPdsItemCount) {
				endRow =totalPdsItemCount;
			}
			List<PdsItem> pdsItemList =pdsItemDao.select(conn, firstRow, endRow);
			
			PdsItemListModel pdsItemListView = new PdsItemListModel(pdsItemList, requestPageNumber, totalPageCount, firstRow, endRow);
			return pdsItemListView;
		}catch(SQLException e) {
			throw new RuntimeException("DB 에러 발생 : "+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
		
	}
	
	public int calculateTotalPageCount(int totalPdsItemCount) {
		if(totalPdsItemCount == 0) {
		return 0;
		}
		int pageCount = totalPdsItemCount /COUNT_PER_PAGE;
		if(totalPdsItemCount % COUNT_PER_PAGE > 0) {
			pageCount++;
		}
		return pageCount;
	}
}

