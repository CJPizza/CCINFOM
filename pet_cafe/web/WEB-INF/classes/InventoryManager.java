import java.sql.Connection;
import java.sql.Date; // Import java.sql.Date for consistency
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventoryManager {

    // Method to add a new inventory item
    public void addInventoryItem(String itemName, String category, String status, int currentStock, String restockFrequency, Date lastRestock) throws SQLException {
        String query = "INSERT INTO inventory (item_name, category, status, currentstock, restock_frequency, last_restock) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, itemName);
            statement.setString(2, category);
            statement.setString(3, status);
            statement.setInt(4, currentStock);
            statement.setString(5, restockFrequency);
            statement.setDate(6, lastRestock); // Set as java.sql.Date
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error adding inventory item: " + e.getMessage());
            throw e;
        }
    }

    // Method to update an existing inventory item
    public void updateItem(int itemId, String itemName, String category, String status, int currentStock, String restockFrequency, Date lastRestock) throws SQLException {
        String query = "UPDATE inventory SET item_name = ?, category = ?, status = ?, currentstock = ?, restock_frequency = ?, last_restock = ? WHERE itemid = ?";
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, itemName);
            statement.setString(2, category);
            statement.setString(3, status);
            statement.setInt(4, currentStock);
            statement.setString(5, restockFrequency);
            statement.setDate(6, lastRestock); // Set as java.sql.Date
            statement.setInt(7, itemId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error updating inventory item: " + e.getMessage());
            throw e;
        }
    }

    // Method to delete an inventory item
    public void deleteItem(int itemId) throws SQLException {
        String query = "DELETE FROM inventory WHERE itemid = ?";
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, itemId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error deleting inventory item: " + e.getMessage());
            throw e;
        }
    }

    // Method to retrieve all inventory items
    public List<String> viewItems() throws SQLException {
        String query = "SELECT * FROM inventory";
        List<String> items = new ArrayList<>();
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                // Create a readable string format for each item
                String itemDetails = String.format("ID: %d, Name: %s, Category: %s, Status: %s, Stock: %d, Restock Frequency: %s, Last Restock: %s",
                        resultSet.getInt("itemid"),
                        resultSet.getString("item_name"),
                        resultSet.getString("category"),
                        resultSet.getString("status"),
                        resultSet.getInt("currentstock"),
                        resultSet.getString("restock_frequency"),
                        resultSet.getDate("last_restock").toString()); // Convert Date to String for display
                items.add(itemDetails);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching inventory items: " + e.getMessage());
            throw e;
        }
        return items;
    }
}
