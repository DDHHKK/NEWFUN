package net.wishlist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.wishlist.controller.Wishlist;



public class WishlistFrontController extends HttpServlet {


	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//가상주소 뽑아오기
			//가상주소 비교
			String requestURI = request.getRequestURI();
			System.out.println(requestURI);
			String contextPath = request.getContextPath();
			System.out.println(contextPath);
			String command = requestURI.substring(contextPath.length());
			
			System.out.println("뽑아온 가상주소 : "+command);
			ActionForward forward = null;
			Action action = null;
				if(command.equals("/Wishlist.wi"))
				{
					action = new Wishlist();
					try
					{
						forward = action.execute(request, response);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
				}
				else if(command.equals("/AddWishlist.wi"))
				{
					action = new AddWishlist();
					try
					{
						forward = action.execute(request, response);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
				}
				else if(command.equals("/BackWishlist.wi"))
				{
					action = new BackWishlist();
					try
					{
						forward = action.execute(request, response);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
				}
				else if(command.equals("/DeleteWishlist.wi"))
				{
					action = new DeleteWishlist();
					try
					{
						forward = action.execute(request, response);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
				}
				
				
				else if(command.equals("/MyWish.wi"))
				{
					action = new MyWish();
					try
					{
						forward = action.execute(request, response);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
				}	
						
				else if(command.equals("/AddMyWish.wi"))
				{
					action = new AddMyWish();
					try
					{
						forward = action.execute(request, response);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
				}	
				else if(command.equals("/DeleteMyWish.wi"))
				{
					action = new DeleteMyWish();
					try
					{
						forward = action.execute(request, response);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					
				}	

				
				
				if(forward!=null)
				{
					if(forward.isRedirect())
					{
						response.sendRedirect(forward.getPath());		
					}
					else
					{
						RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
						dispatcher.forward(request, response);		
					}
				}
				//jsp로 가면 : forward
				//가상주소 : response
		
		}
		
		
		
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			System.out.println("MemberFrontController doGet() 메서드");
			doProcess(request, response);
		}

		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			System.out.println("MemberFrontController doPost() 메서드");
			doProcess(request, response);
		}

	}


