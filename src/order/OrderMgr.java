package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public OrderMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("OrderMgr err : " + e);
		}
	}
	public void insertOrder(OrderBean order) {
		try {
			conn = ds.getConnection();
			String sql = "insert into card_order(card_no, sdate, state, id) values(?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getCard_no());
			pstmt.setString(2, "1");
			pstmt.setString(3, order.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertOrder err : "+ e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	public ArrayList<OrderDto> getOrder(String id){
		ArrayList<OrderDto> list = new ArrayList<OrderDto>();
		try {
			conn= ds.getConnection();
			String sql = "select * from card_order where id=? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDto dto = new OrderDto();
				dto.setNo(rs.getString("no"));
				dto.setCard_no(rs.getString("card_no"));
				dto.setSdate(rs.getString("sdate"));
				dto.setState(rs.getString("state"));
				dto.setId(rs.getString("id"));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getOrder err : "+ e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}return list;
	}
	public ArrayList<OrderDto> getOrderAll(){
		ArrayList<OrderDto> list = new ArrayList<OrderDto>();
		try {
			conn = ds.getConnection();
			String sql = "select * from card_order order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderDto dto = new OrderDto();
				dto.setNo(rs.getString("no"));
				dto.setSdate(rs.getString("sdate"));
				dto.setCard_no(rs.getString("card_no"));
				dto.setState(rs.getString("state"));
				dto.setId(rs.getString("id"));
				list.add(dto);

			}
		} catch (Exception e) {
			System.out.println("getOrderAll err : "+ e);
		}finally {
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
	public OrderDto getOrderDetail(String no) {
		OrderDto dto = null;
		try {
			conn = ds.getConnection();
			String sql = "select * from card_order where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new OrderDto();
				dto.setNo(rs.getString("no"));
				dto.setSdate(rs.getString("sdate"));
				dto.setCard_no(rs.getString("card_no"));

				dto.setState(rs.getString("state"));
				dto.setId(rs.getString("id"));
			}
					
		} catch (Exception e) {
			System.out.println("getOrderdetail err : "+ e);
		}finally {
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
	public boolean updateOrder(String no, String state) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "update card_order set state=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, no);
			if(pstmt.executeUpdate()>0) b = true;
		} catch (Exception e) {
			System.out.println("updateOrder err : "+ e);
		}finally {
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
	public boolean deleteOrder(String no) {
		boolean b = false;
		try {
			conn = ds.getConnection();
			String sql = "delete from card_order where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			if(pstmt.executeUpdate()>0) b = true;
			
		} catch (Exception e) {
			System.out.println("deleteOrder err : "+ e);
		}finally {
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
}
