package fileUpload;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class FileDao {

	public FileDao() {
		// TODO Auto-generated constructor stub
	}

	public int insertFile(FileDto dto) {
		int res = 0;
		// 쿼리문 작성
		String query = "insert into myfile( "
				+ "idx, name, title, cate, ofile, sfile) "
				+ "VALUES( "
				+ "seq_board_num.nextval, ?, ?, ?, ?, ?)";
		
		// conn		
		// 쿼리
		// 쿼리실행
		
		try (Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(query);){
			
			psmt.setString(1,  dto.getName());
			psmt.setString(2,  dto.getTitle());
			psmt.setString(3,  dto.getCate());
			psmt.setString(4,  dto.getOfile());
			psmt.setString(5,  dto.getSfile());
			
			res = psmt.executeUpdate();
			conn.prepareStatement(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	// 파일 목록을 조회합니다.
	public List<FileDto> getFileList(){
		List<FileDto> list = new ArrayList<FileDto>();
		// 쿼리문 작성
		String query = "SELECT * FROM myfile ORDER BY idx DESC";
		// conn
		// 쿼리
		// 쿼리실행
		// 결과집합 담기
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(query);){
			ResultSet rs = psmt.executeQuery();
		
			while(rs.next()) {
				FileDto dto = new FileDto();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				
				list.add(dto); // 목록에 추가
			}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return list;
	}
}
