package com.beans;


public class Order {

 
    private int id;
    private String user;
    private String product_id;

   
    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }
    
    
    
    
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

   

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct(String product) {
        this.product_id = product_id;
    }

   @Override
	public String toString() {
		return "Order [id=" + id + ", user=" + user + ", product_id=" + product_id +"]";
	}

   
    
    
    
}