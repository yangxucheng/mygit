package com.oracle.ebp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.ShoppingCartMapper;
import com.oracle.ebp.domain.ShoppingCart;

@Service
@Scope
public class ShoppingCartService {
  @Resource
  ShoppingCartMapper shoppingcartmapper;
  
  public void insert_shoppingcar(ShoppingCart shoppingcart){
	  shoppingcartmapper.insertByshoppingcart(shoppingcart);
  }
  public void deleteByTid(int tid){
	  shoppingcartmapper.deleteByTid(tid);
  }
  
  public List<ShoppingCart> retrieveAll(){
	  return shoppingcartmapper.retrieveAll();
  }
}
