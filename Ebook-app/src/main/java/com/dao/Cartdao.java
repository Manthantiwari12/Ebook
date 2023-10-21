package com.dao;

import java.util.List;

import com.entity.Cart;

public interface Cartdao {
	public boolean addcart(Cart c);
	public List<Cart> getbookbyuser(int userid);
	public boolean deletebook(int cid);
}
