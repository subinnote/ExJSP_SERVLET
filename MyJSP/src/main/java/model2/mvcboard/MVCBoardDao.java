package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MVCBoardDao {

	public MVCBoardDao() {
		
	}
	public static void main(String[] args) {
		MVCBoardDao dao = new MVCBoardDao();

	      }
	}
	// 총건수 조회
	private int totalCount() {
		int res = 0;
		
		return res;
	}
	// 목록 조회
	public List<MVCBoardDto> getList(){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		String sql = "select * from mvcboard order by idx DESC";
		
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDto dto = new MVCBoardDto(
												rs.getString(1)
												,rs.getString(2)
												,rs.getString(3)
												,rs.getString(4)
												,rs.getString(5)
												,rs.getString(6)
												,rs.getString(7)
												,rs.getInt(8)
												,rs.getString(9)
												,rs.getInt(10)											
												);
				list.add(dto);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
}
