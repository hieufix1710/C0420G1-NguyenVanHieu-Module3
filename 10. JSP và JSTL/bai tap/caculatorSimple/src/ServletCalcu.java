import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletCalcu" ,urlPatterns = "/calculator")
public class ServletCalcu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first=request.getParameter("first");
        String second=request.getParameter("second");
        String operator=request.getParameter("operator");

        float result=Calculator.calculate(Float.parseFloat(first),Float.parseFloat(second),operator);
        PrintWriter writer=response.getWriter();
        writer.write("<html>");
        writer.write(String.valueOf(result));
        writer.write("</html>");
    }
}
