package PetCafe;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;
import java.text.DateFormatSymbols;

public class health {
    public int petid;
    public enum vaccination_status
    {
        vaccinated, unvaccinated
    }
    public vaccination_status vaccination_status;
    public String specialneeds;
    public String ongoingtreatment;
    public Boolean treated;
    public Date treatment_start;
    public Date treatment_end;
    
    public health() {}
    
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
    
        public int addHealthHistory(int petid, vaccination_status vaccination_status, String specialneeds, String ongoingtreatment, Date treatment_start, Date treatment_end) {
        String checkPetQuery = "SELECT COUNT(*) FROM pet WHERE petid = ?";
        String sql = "INSERT INTO health_history(petid, vaccination_status, special_needs, ongoing_treatment, treated, treatment_start, treatment_end) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = connect()) {
            if (conn == null) {
                System.out.println("Database connection failed. Exiting...");
                return 0;
            }

            try (PreparedStatement checkPetStmt = conn.prepareStatement(checkPetQuery)) {
                checkPetStmt.setInt(1, petid);
                ResultSet rs = checkPetStmt.executeQuery();
                if (rs.next() && rs.getInt(1) == 0) {
                    System.out.println("Pet with ID " + petid + " does not exist.");
                    return 0; // Exit if pet does not exist
                }
            }

            // Insert health history record
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, petid);
                pstmt.setString(2, vaccination_status.name()); // Store the enum as a string
                pstmt.setString(3, specialneeds);
                pstmt.setString(4, ongoingtreatment);
                pstmt.setDate(5, new java.sql.Date(treatment_start.getTime())); // Convert Date to SQL Date
                pstmt.setDate(6, new java.sql.Date(treatment_end.getTime())); // Convert Date to SQL Date

                pstmt.executeUpdate();
                System.out.println("Health history added successfully!");
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("SQL Query: " + sql);
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Database connection error: " + e.getMessage());
            return 0;
        }

        return 1;
    }
    
    public static void main(String args[])
    {
        
    }
}
