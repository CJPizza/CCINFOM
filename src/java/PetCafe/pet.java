package PetCafe;

import java.util.*;
import java.sql.*;

public class pet {
    public int petid;
    public String petname;
    public String petspecies;
    public String petbreed;
    public int ownerid;

    public ArrayList<Integer> petid_list = new ArrayList<>();
    public ArrayList<String> petname_list = new ArrayList<>();
    public ArrayList<String> petspecies_list = new ArrayList<>();
    public ArrayList<String> petbreed_list = new ArrayList<>();
    public ArrayList<Integer> ownerid_list = new ArrayList<>();

    public pet() {}

    public static Connection connect() 
    {
        try 
        {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PetCafe", "root", "sophia930");
            if (conn != null) 
            {
                System.out.println("Connection is Successful!");
            }
            return conn;
        } catch (SQLException e) 
        {
            System.out.println("Connection failed: " + e.getMessage());
            return null;
        }
    }
    
    public int addPet(String petname, String petspecies, String petbreed, int ownerid) 
    {
    String checkOwnerQuery = "SELECT COUNT(*) FROM customers WHERE customerid = ?";
    String sql = "INSERT INTO pet(petid, petname, petspecies, petbreed, ownerid) VALUES (?, ?, ?, ?, ?)";
    String qry = "SELECT MAX(petid) + 1 AS newID FROM pet";
    int petid = 0;

    try (Connection conn = connect()) 
    {
        if (conn == null) 
        {
            System.out.println("Database connection failed. Exiting...");
            return 0;
        }

        try (PreparedStatement checkOwnerStmt = conn.prepareStatement(checkOwnerQuery)) 
        {
            checkOwnerStmt.setInt(1, ownerid);
            ResultSet rs = checkOwnerStmt.executeQuery();
            if (rs.next() && rs.getInt(1) == 0) 
            {
                System.out.println("Owner with ID " + ownerid + " does not exist.");
                return 0; // Exit if owner does not exist
            }
        }

        try (PreparedStatement pstmt = conn.prepareStatement(qry)) 
        {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) 
            {
                petid = rs.getInt("newID");
            }
            rs.close();
        }

        if (petid == 0) petid += 1;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) 
        {
            pstmt.setInt(1, petid);
            pstmt.setString(2, petname);
            pstmt.setString(3, petspecies);
            pstmt.setString(4, petbreed);
            pstmt.setInt(5, ownerid); // Set the ownerid here

            pstmt.executeUpdate();
            System.out.println("Pet added successfully!");
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
            System.out.println("SQL Query: " + sql);
            return 0;
        }
    } 
    catch (SQLException e) 
    {
        e.printStackTrace();
        System.out.println("Database connection error: " + e.getMessage());
        return 0;
    }

    return 1;
}
    
    public int deletePet(int petid) 
    {
        String deleteGroomingHistorySQL = "DELETE FROM grooming_history WHERE petid = ?";
        String deleteReservationSQL = "DELETE FROM reservation WHERE petid = ?";
        String deletePetSQL = "DELETE FROM pet WHERE petid = ?";

        try (Connection conn = connect()) {
            conn.setAutoCommit(false);

            try (PreparedStatement pstmtGrooming = conn.prepareStatement(deleteGroomingHistorySQL);
                 PreparedStatement pstmtReservation = conn.prepareStatement(deleteReservationSQL);
                 PreparedStatement pstmtPet = conn.prepareStatement(deletePetSQL)) {

                pstmtGrooming.setInt(1, petid);
                pstmtGrooming.executeUpdate();

                pstmtReservation.setInt(1, petid);
                pstmtReservation.executeUpdate();

                pstmtPet.setInt(1, petid);
                int rowsAffected = pstmtPet.executeUpdate();

                conn.commit();

                if (rowsAffected == 0) {
                    return 0;
                }

            } 
            catch (SQLException e) 
            {
                conn.rollback();
                e.printStackTrace();
                return -1;
            }

        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
            return -1;
        }

        return 1;
    }

public int updatePet(int petid, String petname, String petspecies, String petbreed, int ownerid) {
    String sql = "UPDATE pet SET petname = ?, petspecies = ?, petbreed = ?, ownerid = ? WHERE petid = ?";
    
    try (Connection conn = connect()) {
        if (conn == null) {
            System.out.println("Failed to establish a database connection.");
            return -1; // Return -1 if the connection is null
        }

        // Prepare the statement
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Set the parameters
            pstmt.setString(1, petname);
            pstmt.setString(2, petspecies);
            pstmt.setString(3, petbreed);
            pstmt.setInt(4, ownerid);
            pstmt.setInt(5, petid); // Set petid for the WHERE clause

            // Execute the update
            int rowsAffected = pstmt.executeUpdate();

            // Return the number of rows affected
            if (rowsAffected > 0) {
                System.out.println("Pet updated successfully!");
                return 1; // Return 1 if update is successful
            } else {
                System.out.println("No pet found with the given ID.");
                return 0; // Return 0 if no pet was found with the given ID
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1; // Return -1 if an error occurs during the update
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return -1; // Return -1 if an error occurs while connecting
    }
}
    
    public static void main(String args[]) {
        pet A = new pet();
        A.deletePet(400009);
    }
}
