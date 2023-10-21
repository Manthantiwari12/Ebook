package com.dao;

import java.util.List;

import com.entity.Bookdetails;

public interface BooksDao {
	public boolean addbooks(Bookdetails b);
	public List<Bookdetails> getallbooks();
	public Bookdetails getbookbyid(int id);
	public boolean updatebook(Bookdetails b);
	public boolean deletebooks(int id);
	public List<Bookdetails> getnewbook();
	public List<Bookdetails> getrecentbooks();
	public List<Bookdetails> getoldbooks();
	public List<Bookdetails> getallrecentbook();
	public List<Bookdetails> getallnewbook();
	public List<Bookdetails> getalloldbook();
	public List<Bookdetails> getoldbookbyuid(String usermail,String category);
	public boolean deleteoldbook(int id);
	public List<Bookdetails> getsearchbook(String search);
	
}
