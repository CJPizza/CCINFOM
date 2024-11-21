import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateInventoryServlet")
public class UpdateInventoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form data from the request
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            String itemName = request.getParameter("itemName");
            String category = request.getParameter("category");
            String status = request.getParameter("status");
            int stock = Integer.parseInt(request.getParameter("stock"));
            String frequency = request.getParameter("frequency");
            String restockDateStr = request.getParameter("restockDate");

            // Convert restockDate string to java.sql.Date
            Date restockDate = null;
            if (restockDateStr != null && !restockDateStr.isEmpty()) {
                restockDate = Date.valueOf(restockDateStr); // YYYY-MM-DD format
            }

            // Use InventoryManager to update the inventory
            InventoryManager manager = new InventoryManager();
            manager.updateItem(itemId, itemName, category, status, stock, frequency, restockDate);

            // Redirect to success page
            response.sendRedirect("inventory_records.jsp?status=updated");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page
            response.sendRedirect("inventory_records.jsp?status=error");
        }
    }
}
