package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.entity.Book_order;

public class Bookorderdaoimpl implements Bookorderdao{
	private Connection conn;
	
	
	public Bookorderdaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public int getorderno() {
		// TODO Auto-generated method stub
		int i =1;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}


	public boolean saveorder(List<Book_order> order) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into book_order(orderid,username,email,address,phone,bookname,author,price,payment,userid) values(?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(Book_order b:order) {
				ps.setString(1, b.getOrderid());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladdress());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookname());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaytype());
				ps.setInt(10, b.getUserid());
				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}


	public List<Book_order> getorder(int id) {
		// TODO Auto-generated method stub
		List<Book_order> list = new ArrayList<Book_order>();
		Book_order o = null;
		try {
			String sql = "select * from book_order where userid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o = new Book_order();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladdress(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaytype(rs.getString(10));
				o.setUserid(rs.getInt(11));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Book_order> getallorder() {
		// TODO Auto-generated method stub
		List<Book_order> list = new ArrayList<Book_order>();
		Book_order o = null;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				o = new Book_order();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladdress(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaytype(rs.getString(10));
				o.setUserid(rs.getInt(11));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

}
