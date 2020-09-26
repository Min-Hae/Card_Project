package card;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CardMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public CardMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("CardMgr err : " + e);
		}
	}
	
	public ArrayList<CardDto> getCardAll(){
		ArrayList<CardDto> list = new ArrayList<CardDto>();
		try {
			conn = ds.getConnection();
			String sql = "select * from card order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CardDto dto = new CardDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setDetail(rs.getString("detail"));
				dto.setSdate(rs.getString("sdate"));
				dto.setImage(rs.getString("image"));
				dto.setPart(rs.getString("part"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getCardAll err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}

	public boolean insertCard(HttpServletRequest request) {
		boolean b = false;
		try {
			String uploadDir ="C:\\Users\\tgtgt\\eclipse-workspace\\Bank\\WebContent\\image";

			MultipartRequest multi = new MultipartRequest(request, 
						uploadDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			conn = ds.getConnection();
			String sql = "insert into card(name, detail, sdate, image, part) values(?,?,now(),?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("detail"));

			if(multi.getFilesystemName("image") == null) {
				pstmt.setString(3, "ready.gif"); 
			}else {
				pstmt.setString(3, multi.getFilesystemName("image"));
			}
			pstmt.setString(4, multi.getParameter("part"));
			
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("insertCard err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	
	public CardDto getCard(String no) {
		CardDto dto = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from card where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new CardDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setDetail(rs.getString("detail"));
				dto.setSdate(rs.getString("sdate"));
				dto.setImage(rs.getString("image"));
			}
		} catch (Exception e) {
			System.out.println("getCard err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	public ArrayList<CardDto> getCardBenefit(String detail){
		ArrayList<CardDto> list = new ArrayList<CardDto>();
		try {
			conn = ds.getConnection();
			String sql = "select * from card where detail like '%";
			sql+=	detail;
			sql+="%' order by no desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CardDto dto = new CardDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setDetail(rs.getString("detail"));
				dto.setSdate(rs.getString("sdate"));
				dto.setImage(rs.getString("image"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getCardBenefit err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	public ArrayList<CardDto> getCardPart(String part) {
		ArrayList<CardDto> list = new ArrayList<CardDto>();

		try {
			conn = ds.getConnection();
			String sql = "select * from card where part=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CardDto dto = new CardDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setDetail(rs.getString("detail"));
				dto.setSdate(rs.getString("sdate"));
				dto.setImage(rs.getString("image"));
				dto.setPart(rs.getString("part"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getCard err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	public boolean updateCard(HttpServletRequest request) {
		boolean b = false;
		try {
			
			String uploadDir ="C:\\Users\\tgtgt\\eclipse-workspace\\Bank\\WebContent\\image";
			MultipartRequest multi = new MultipartRequest(request, 
						uploadDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			conn = ds.getConnection();
			
			if(multi.getFilesystemName("image") == null) {
				String sql = "update card set name=?,detail=? where no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("detail"));
				pstmt.setString(3, multi.getParameter("no"));
			}else {
				String sql = "update card set name=?,detail=?,image=? where no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("detail"));
				pstmt.setString(3, multi.getFilesystemName("image"));
				pstmt.setString(4, multi.getParameter("no"));
			}
			
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("updateCard err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return b;
	}
	public boolean deleteCard(String no) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql="delete from card where no=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			if(pstmt.executeUpdate()>0) b = true;
		} catch (Exception e) {
			System.out.println("DeleteCard err : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}}
		return b;
	}
}
