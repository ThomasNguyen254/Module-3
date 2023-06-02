import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstOperand = Integer.parseInt(request.getParameter("first-operand"));
        float secondOperand = Integer.parseInt(request.getParameter("second-operand"));
        char operator = request.getParameter("operator").charAt(0);
        float result = 0;
        try {
            result = Calculator.calculator(firstOperand,secondOperand,operator);
            request.setAttribute("result",result);
            request.getRequestDispatcher("/result.jsp").forward(request,response);
        } catch (Exception e) {
            request.setAttribute("result",e.getMessage());
            request.getRequestDispatcher("/result.jsp").forward(request,response);
        }
    }
}
