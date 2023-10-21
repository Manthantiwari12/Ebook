package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class Cartdaoimpl implements Cartdao{
	
	
	private Connection conn;
	
	
	public Cartdaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean addcart(Cart c) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into cart(bid,uid,bookname,author,price,totalprice) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookname());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalprice());
			
			int i = ps.executeUpdate();
			if (i==1) {
				f=true;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}


	public List<Cart> getbookbyuser(int userid) {
		// TODO Auto-generated method stub
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		try {
			String sql ="select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				c.setTotalprice(rs.getDouble(7));
				list.add(c);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}


	


	public boolean deletebook(int cid) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "delete from cart where cid=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			
			int i = ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}

}
