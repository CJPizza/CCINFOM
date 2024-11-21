import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddInventoryServlet")
public class AddInventoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String itemName = request.getParameter("item_name");
        String category = request.getParameter("category");
        String status = request.getParameter("status");
        int currentStock = Integer.parseInt(request.getParameter("current_stock"));
        String restockDate = request.getParameter("restock_date");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_cafe", "cj", "1234");

            // SQL query
            String sql = "INSERT INTO inventory (item_name, category, status, currentstock, last_restock) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemName);
            stmt.setString(2, category);
            stmt.setString(3, status);
            stmt.setInt(4, currentStock);
            stmt.setString(5, restockDate);

            // Execute query
            stmt.executeUpdate();

            // Close resources
            stmt.close();
            conn.close();

            // Redirect to the inventory page
            response.sendRedirect("inventory_records.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("inventory_records.jsp?status=error");
        }
    }
}
