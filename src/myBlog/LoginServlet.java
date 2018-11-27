package myBlog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    static final String HTML_FORM = "<html><head><title>MyBlog</title></head><body>%s</body></html>";

    static final Map<String,User> usersMap = new HashMap<>();

    static {
        User admin = new User("admin","admin","Administrator","admin");
        usersMap.put("admin",admin);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentLogin = request.getParameter("login");
        String currentPass = request.getParameter("password");
        String currentName = request.getParameter("name");
        String currentRole = request.getParameter("role");

        if (request.getParameter("newuser").equals("yes")) {
            usersMap.put(currentLogin, new User(currentLogin,currentPass,currentName,currentRole));
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }

        if (usersMap.containsKey(currentLogin)){
            if (currentPass.equals(usersMap.get(currentLogin).getPassword())){
                response.getWriter().println(String.format(HTML_FORM, "Wellcome " + usersMap.get(currentLogin).getName() + "!!!"));
                response.getWriter().println(String.format(HTML_FORM, "Your acces is " + usersMap.get(currentLogin).getRole() + "!!!"));
                request.getSession().setAttribute("user", usersMap.get(currentLogin));
                request.getRequestDispatcher("/Wellcome.jsp").forward(request,response);
            } else {
                response.getWriter().println(String.format(HTML_FORM, "Wrong passwword"));
            }
        } else {
            response.getWriter().println(String.format(HTML_FORM, "Wrong login"));
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/Registration.jsp").forward(request,response);

    }
}
