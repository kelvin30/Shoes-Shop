package com.controller;

import com.beans.Order;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.beans.Product;
import com.beans.User;
import com.model.DB;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
        ArrayList<Product> list = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	HttpSession session;
        
        public String getSession(){
           return session.getAttribute("username").toString();
        }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null || page.equals("index")) {
			
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 session = request.getSession();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		/*
                if(page.equals("addorder")){
                    String name = request.getParameter("name");
                    String id = request.getParameter("id");
                    
                    Order order = new Order();
                    order.setUser(name);
                    order.setProduct(id);
                    
                    DB db = new DB();
                    try{
                        db.addOrder(u, p);
                    }catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                }
                */
		if(page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
                        String phone = request.getParameter("phone");
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");
			
			if(password_1.equals(password_2)) {
				
				User user = new User();
				user.setAddress(address);
				user.setEmail(email);
				user.setName(name);
                                user.setPhone(phone);
				user.setUsername(username);
				user.setPassword(password_1);
				
				DB db = new DB();
				try {
					db.addUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.setAttribute("username", username);
				request.setAttribute("msg", "Account created successfully, now you can login!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "Passwords entered do not match");
				request.setAttribute("name", name);
				request.setAttribute("address", address);
				request.setAttribute("email", email);
                                request.setAttribute("phone",phone);
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DB db = new DB();
			User user = new User();
			boolean status = false;
			try {
				status = db.checkUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.fetchUser();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("address", user.fetchadd(userList,username));
				session.setAttribute("email", user.fetchemail(userList,username));
				session.setAttribute("name", user.fetchname(userList,username));
				session.setAttribute("username", username);
                                session.setAttribute("phone",user.fetchphone(userList, username));
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Invalid Username or Password");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		if(page.equals("all_products")) {
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
			
			
			if(page.equals("all_products"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
		
		if(page.equals("showcart")) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("addtocart")) {
			String id = request.getParameter("id");
                        String action = request.getParameter("action");
			Product p = new Product();
			boolean check = p.check(cartlist,id);
			
			if(check)
				JOptionPane.showMessageDialog(null, "Product is already on your cart", "Sorry", JOptionPane.INFORMATION_MESSAGE);
                        else  {
			cartlist.add(id);
			JOptionPane.showMessageDialog(null, "Product added to your cart", "Success", JOptionPane.INFORMATION_MESSAGE);
			}
                        
			
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("allproducts"))
				request.getRequestDispatcher("all_products.jsp").forward(request, response);
			
		}
		
		if(page.equals("success")) {
	            session = request.getSession();
                    String prodId = request.getParameter("prod_id");
                    session = request.getSession();
                    String username = (String)request.getSession().getAttribute("username");
                    
                    DB db = new DB();
                    try {
                        db.addOrder(username, prodId);
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
			
                        request.getRequestDispatcher("success.jsp").forward(request, response);
			
			/*session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);*/
                        
                      
		}
		/*
                if(page.equals("success-btn")) {
                
                        String name = request.getParameter("name");
			String product = request.getParameter("product");
			String address = request.getParameter("address");
			Order o = new Order();
			request.getParameter(name);
			request.getParameter(product);
			request.getParameter(address);
			
			
			DB db = new DB();
			
                            try{
			         db.addOrder(o);
			 }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
                    
                }
                */
                
		if(page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist,id);
			
			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("price-sort")) {
			String price = request.getParameter("sort");
			String action = request.getParameter("action");
			Product p = new Product();
			if(price.equals("low-to-high"))
				list = p.lowtohigh(list);
			else
				list = p.hightolow(list);
			
			session.setAttribute("list", list);
			
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("all_products"))
				request.getRequestDispatcher("all_products.jsp").forward(request, response);
			
		}
	}

        
}
