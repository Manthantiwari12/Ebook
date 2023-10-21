package com.dao;

import java.util.List;

import com.entity.Book_order;

public interface Bookorderdao {
	public int getorderno();
	public boolean saveorder(List<Book_order> order);
	public List<Book_order> getorder(int id);
	public List<Book_order> getallorder();
}
