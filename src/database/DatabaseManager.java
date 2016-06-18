package database;

import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
public class DatabaseManager {

    public Connection con;
    private ResultSet rs;
    private PreparedStatement st;
    public String success;


    public DatabaseManager(){


        con = null;
        st = null;
        rs = null;


        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {

            success="failed";

        }
        try {
              con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/emagazine", "mrc", "mrc");
              con.setAutoCommit(false); //to enable transactions
              success = "success";
        } catch (SQLException e) {
            success="failed";
            //System.out.print(e.getMessage());
        }

    }

    /**
     * performs insert query on database specified by sqlStatement query
     * returns String "success" on completion without interruption and String "failed" in case of any Exception
     */
    public String insert(PreparedStatement insertStatement) {
        String success = "inserted";
        st = null;
        try {
            //preparing insert statement
            //st = con.prepareStatement(insertStatement);
            insertStatement.executeUpdate();

        } catch (Exception e) {
            //SQLException
            if (con != null) {
                try {
                    con.rollback();
                } catch (Exception e1) {
                    //cannot rollback
                    success = "failed";
                    return success;
                }
            }
             //e.printStackTrace(); //TO BE REMOVED
            //System.out.println(e.getMessage());
            //success = "failed";
            success = e.getMessage();
            return success; //terminate the function
        }
        return success;
    }


    //for select statement on mysql db
    public ResultSet select(PreparedStatement selectStatement) {
        //st = null;
        rs = null;
        try {

            rs = selectStatement.executeQuery();
        } catch (Exception e) {

            return rs; //return null if unable to perform select on the data
        }

        return rs;
    }

    /**
     * Used to perform update operation on database. Takes input update sql statement and return success in case of execution without interruption.
     */
    public String update(PreparedStatement updateStatement) {
        String success = "success";
        //st = null;
        try {
            //st = con.prepareStatement(updateStatement);
            updateStatement.executeUpdate();
        } catch (Exception e) {
            //probably SQLException
            success = "failed";
            return success;
        }


        return success;
    }


    /**
     * close() required to commit all changes to database
     * closes all the open connection in the db
     */
    //to close db connections
    public String close() {

        //REQUIRED for committing to the database.(for query to complete.)
        try {
            con.commit();
        } catch (SQLException e) {
            return "failed";
        }


        if (con != null) {   //closing connection
            try {
                con.close();
            } catch (Exception e) {
                //Ignore
            }
        }
        if (st != null) {
            try {
                st.close();
            } catch (Exception e) {
                //Ignore
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                //Ignore
            }
        }
        return "success";
    }
}
