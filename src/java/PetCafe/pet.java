package PetCafe;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Lenovo
 */
import java.util.*;
import java.sql.*;

public class pet 
{
    public int petID;
    public String petName;
    public String petSpecies;
    public String petBreed;
    
    public ArrayList<Integer> petID_list = new ArrayList<> ();
    public ArrayList<String> petName_list = new ArrayList<> ();
    public ArrayList<String> petSpecies_list = new ArrayList<> ();
    public ArrayList<String> petBreed_list = new ArrayList<> ();
    
    public pet() {}
    
    public static int addPet()
    {
        try
        {
            DriverManager.getConnection("jdbc:mysql://localhost:3306/PetCafe", "cj", "1234");
            System.out.println("Connection is Successful!");
        }
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public static void main (String args[])
    {
        addPet();
    }
}
