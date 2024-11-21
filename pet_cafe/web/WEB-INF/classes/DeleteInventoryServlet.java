import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteInventoryServlet")
public class DeleteInventoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId")); // Get item ID from form

        try {
            InventoryManager manager = new InventoryManager();
            manager.deleteItem(itemId);
            response.sendRedirect("inventory_records.jsp?status=deleted"); // Redirect with success status
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("inventory_records.jsp?status=error"); // Redirect with error status
        }
    }
}
