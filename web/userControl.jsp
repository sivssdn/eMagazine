<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="authenticate.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String requestFor = request.getParameter("requestFor");

    if(requestFor.equals("login")) {
        User login = new User();
        String hashPassword = login.hash(password);
        String area = login.checkValidUserAndGetArea(email, hashPassword);
        if (!area.equals("")) {
            session.setAttribute("email", email);
            session.setAttribute("area", area);
            response.sendRedirect("createEdition.jsp");
        } else {
            out.println("Invalid Email or Password");
        }
    }
    else if(requestFor.equals("logout")){
        session.invalidate();
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "login.jsp");
    }
    else if(requestFor.equals("create_user")){
        String area = request.getParameter("area");
        User user = new User();
        String hashPassword = user.hash(password);
        user.createNewUser(email, hashPassword, area);

        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "createEdition.jsp");
    }
%>


