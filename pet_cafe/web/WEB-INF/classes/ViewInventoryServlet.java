import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewInventoryServlet")
public class ViewInventoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            InventoryManager manager = new InventoryManager();
            List<String> inventoryList = manager.viewItems(); // Fetch all inventory items
            request.setAttribute("inventoryList", inventoryList); // Pass data to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("view_inventory.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("inventory_records.jsp?status=error"); // Redirect with error status
        }
    }
}
