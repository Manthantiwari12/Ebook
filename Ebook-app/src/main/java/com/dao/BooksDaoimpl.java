package com.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Bookdetails;

public class BooksDaoimpl implements BooksDao{
	
	public Connection conn;
	public BooksDaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean addbooks(Bookdetails b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into book_details(bookname,author,price,bookcategory,status,photo,useremail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getUseremail());
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


	public List<Bookdetails> getallbooks() {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		try {
			String sql = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return list;
	}


	public Bookdetails getbookbyid(int id) {
		// TODO Auto-generated method stub
		
		Bookdetails b = null;
		try {
			String sql = "select * from book_details where bookid = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return b;
	}


	public boolean updatebook(Bookdetails b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "update book_details set bookname=?, author=?, price=?,status=? where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookid());
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


	public boolean deletebooks(int id) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "delete from book_details where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return f;
	}


	public List<Bookdetails> getnewbook() {
		// TODO Auto-generated method stub
		
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql = "select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "new");
			ps.setString(2, "active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Bookdetails> getrecentbooks() {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql = "select * from book_details where status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Bookdetails> getoldbooks() {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql = "select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2, "active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while (rs.next() && i<=4) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Bookdetails> getallrecentbook() {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql = "select * from book_details where status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Bookdetails> getallnewbook() {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql = "select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "new");
			ps.setString(2, "active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next() ) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Bookdetails> getalloldbook() {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql = "select * from book_details where bookcategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "old");
			ps.setString(2, "active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


	public List<Bookdetails> getoldbookbyuid(String usermail, String category) {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b = null;
		try {
			String sql = "select * from book_details where bookcategory=? and useremail=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setString(2, usermail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return list;
	}


	public boolean deleteoldbook(int id) {
		// TODO Auto-generated method stub
		
		boolean f = false;
		try {
			String sql = "delete from book_details where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
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


	public List<Bookdetails> getsearchbook(String search) {
		// TODO Auto-generated method stub
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql = "select * from book_details where bookname like ? or author like ? or bookcategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+search+"%");
			ps.setString(2, "%"+search+"%");
			ps.setString(3, "%"+search+"%");
			ps.setString(4, "active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

}
