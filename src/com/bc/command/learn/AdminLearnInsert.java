package com.bc.command.learn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.EduDAOImpl;

public class AdminLearnInsert implements LearnCommandServlet{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			request.setAttribute("edlist", new EduDAOImpl().exam());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "eduadmin/view/adminlearninsert.jsp";
	}
}
