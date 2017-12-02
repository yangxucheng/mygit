package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.ShoppingCart;

public interface ShoppingCartMapper {
	public void insertByshoppingcart(ShoppingCart shoppingcart);
	
	public void deleteByTid(int tid);
	
	public List<ShoppingCart> retrieveAll();
}
