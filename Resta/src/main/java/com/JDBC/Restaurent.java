package com.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.dto.CartItem;
import com.model.dto.Products;
import com.model.dto.Users;
import com.utility.DAO;

public class Restaurent {
	
	  DAO d=new DAO();
	 
	  Connection con=d.getConnections();
	  
	  public String registerUser(Users u) {
		   String status="failure";
		   
		   
		    try {
				PreparedStatement ps=con.prepareStatement("insert into users(name,email,password,phone) values(?,?,?,?)");
			    ps.setString(1, u.getName());
			    ps.setString(2,u.getEmail());
			    ps.setString(3, u.getPassword());
			    ps.setString(4, u.getPhone());
			    int n=ps.executeUpdate();
			    if(n>0) {
			    	status="success";
			    }
		    } catch (SQLException e) {
				e.printStackTrace();
			}
		   return status; 
	  }
	  
	  public int loginVerify(String email,String password) {
		  
		    int userid=-1;
		    try {
				PreparedStatement ps=con.prepareStatement("select * from users where email=? and password=?");
			    ps.setString(1, email);
			    ps.setString(2, password);
		        ResultSet rs=ps.executeQuery();
		        while(rs.next()) {
		        	userid=rs.getInt(0);
		        }
		    
		    } catch (SQLException e) {
				
				e.printStackTrace();
			}
		  
		  return userid;
	  }
	  
	  public Users getUserByEmailAndPassword(String email, String password) {
		    Users user = null;

		    try {
		        PreparedStatement ps = con.prepareStatement("SELECT id, name, email, password, phone FROM users WHERE email=? AND password=?");
		        ps.setString(1, email);
		        ps.setString(2, password);
		        ResultSet rs = ps.executeQuery();
		        
		        if (rs.next()) { 
		        	
		            user = new Users(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("phone"));
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return user;
	  }
	  
	  public boolean updateUser(Users u) {
		  
		  boolean status=false;
		  try {
			PreparedStatement ps=con.prepareStatement("update users set name=?,email=?,password=?,phone=? where id=?");
			ps.setString(1,u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4,u.getPhone());
			ps.setInt(5, u.getId());
			int n=ps.executeUpdate();
			if(n>0) {
				status=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  return status;
	  }
	  
	  public boolean addProduct(Products p) {
		    boolean status = false;
		    
		    try {
		        PreparedStatement ps = con.prepareStatement("INSERT INTO products(name, description, price, category, image) VALUES (?, ?, ?, ?, ?)");
		        ps.setString(1, p.getName());
		        ps.setString(2, p.getDescription());
		        ps.setDouble(3, p.getPrice());
		        ps.setString(4, p.getCategory());
		        ps.setBytes(5, p.getImage());
		        
		        int n = ps.executeUpdate();
		        if (n > 0) {
		            status = true;
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();  // Print SQL error
		    }
		    
		    return status;
		}
	  
	  public List<Products> allProducts() {
		  System.out.println("Hello AllProducts...!!");
		    List<Products> productList = new ArrayList<>();

		    try {
		        PreparedStatement ps = con.prepareStatement("SELECT id, name, description, price, category, image FROM products");
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            int id = rs.getInt("id"); // Fetch ID
		            String name = rs.getString("name");
		            String description = rs.getString("description");
		            double price = rs.getDouble("price");
		            String category = rs.getString("category"); // Fetch category
		            byte[] image = rs.getBytes("image");

		            productList.add(new Products(id, name, description, price, category, image));

		        System.out.println("productList"+productList);
		        }
		        
		 
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return productList;
		}
	  
	  
	  public boolean updateProduct(Products p) {
		  boolean status= false;
		  try {
			    PreparedStatement ps=con.prepareStatement("update products set name=?,description=?,price=?,category=?, image=? where id=?");
			    ps.setString(1, p.getName());
		        ps.setString(2, p.getDescription());
		        ps.setDouble(3, p.getPrice());
		        ps.setString(4, p.getCategory());
		        ps.setBytes(5, p.getImage());
		        ps.setInt(6, p.getId()); // Make sure you have the 'id' field in Products model
		        
		        // Execute the update query
		        int rowsUpdated = ps.executeUpdate();
		        
		        // Check if the update was successful
		        if (rowsUpdated > 0) {
		            status = true;
		        }
		    
		  } catch (SQLException e) {
			
			e.printStackTrace();
		}
		  return status;
	  }
	  
	  public Products edit(int id) {
		    Products p = null;
		    try {
		        PreparedStatement ps = con.prepareStatement("SELECT id, name, description, price, category, image FROM products WHERE id = ?");
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            int id1 = rs.getInt("id");
		            String name = rs.getString("name");
		            String description = rs.getString("description");
		            double price = rs.getDouble("price");
		            String category = rs.getString("category");
		            byte[] image = rs.getBytes("image");
		            p = new Products(id1, name, description, price, category, image);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return p;
		}
	  
	  public boolean addToCart(int userId,int productId) {
		  boolean status=false;
          try {
			PreparedStatement ps=con.prepareStatement("insert into cart(user_id,product_id,quantity) value(?,?,?)");
		    ps.setInt(1, userId);
		    ps.setInt(2, productId);
		    ps.setInt(3, 1);
		    int n=ps.executeUpdate();
		    if(n>0) {
		    	status=true;
		    }
          } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  return status;
	  }
	  
	  public List<CartItem> allCartItems(int userID) {
		    List<CartItem> cartItems = new ArrayList<>();

		    try {
		        String query = "SELECT c.id,p.name, p.price, p.category, c.quantity,p.image " +
		                       "FROM products AS p " +
		                       "INNER JOIN cart AS c ON p.id = c.product_id " +
		                       "WHERE c.user_id = ?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setInt(1, userID);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            CartItem item = new CartItem(
		            	rs.getInt(1),
		                rs.getString(2),  
		                rs.getDouble(3),  
		                rs.getString(4), 
		                rs.getInt(5), 
		                rs.getBytes(6)
		            );
		            cartItems.add(item);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return cartItems;
		}
	  
	  public boolean removeCartItem(int id) {
		  boolean status=false;
		   
		  try {
			PreparedStatement ps=con.prepareStatement("delete from cart where id=?");
			ps.setInt(1, id);
			int n=ps.executeUpdate();
			if(n>0) {
				status=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  return status;
	  }
	  public boolean updateCartQuantity(int cartId, int quantity) {
	        String query = "UPDATE cart SET quantity=? WHERE id=?";
	        try {
	             PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, quantity);
	            ps.setInt(2, cartId);

	            return ps.executeUpdate() > 0; 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	  
	    public double getUpdatedPrice(int cartId) {
	        String query = "SELECT p.price * c.quantity AS total_price FROM products p " +
	                       "INNER JOIN cart c ON p.id = c.product_id WHERE c.id=?";
	        try {
	             PreparedStatement ps = con.prepareStatement(query);

	            ps.setInt(1, cartId);
	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    return rs.getDouble("total_price");
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return 0;
	    }
	  
}
