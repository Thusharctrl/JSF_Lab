import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
@WebServlet("/ServletSession")
public class ServletSession extends HttpServlet {
    public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        out.println("<form method='post'>");
        out.println("Name: <input name='username'><br>");
        out.println("Password: <input name='password'><br>");
        out.println("<input type='submit'>");
        out.println("</form>");
    }
    public void doPost(HttpServletRequest req,
                       HttpServletResponse res) throws IOException {
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        PrintWriter out = res.getWriter();
        out.println("<html><body><h2>Submitted Data</h2>");
        out.println("Name: " + name + "<br>");
        out.println("Password: " + password + "<br>");
        out.println("</body></html>");
    }
}
