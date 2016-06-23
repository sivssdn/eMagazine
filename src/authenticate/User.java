package authenticate;

import database.DatabaseManager;

import java.security.MessageDigest;
import java.sql.*;

public class User {

    public String checkValidUserAndGetArea(String email, String password) {
        String area = "";

        try {

            DatabaseManager db = new DatabaseManager();

            String statement = "SELECT * FROM eMagazine.public.users WHERE email = ? AND password = ?;";
            PreparedStatement preparedStatement = db.con.prepareStatement(statement);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = db.select(preparedStatement);

            if (rs.next()) {
                area = rs.getString("area");
            }

            db.close();

        } catch (Exception e) {
            System.out.println("not successful");
            e.printStackTrace();
        }
        return area;
    }

    public void createNewUser(String email, String password, String area) {
        try {
            DatabaseManager db = new DatabaseManager();

            String statement = "INSERT INTO emagazine.public.users (email, password, area) " +
                    " VALUES (?, ?, ?);";
            PreparedStatement preparedStatement = db.con.prepareStatement(statement);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, area);

            db.insert(preparedStatement);

            db.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String hash(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            //System.out.print(hexString.toString());
            return hexString.toString();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public boolean checkUserExists (String email){
        boolean flag = false;

        try{

            DatabaseManager db = new DatabaseManager();

            String statement = "SELECT * FROM eMagazine.public.users WHERE email = ?;";
            PreparedStatement preparedStatement = db.con.prepareStatement(statement);
            preparedStatement.setString(1, email);
            ResultSet rs = db.select(preparedStatement);

            if (rs.next()) {
                flag = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }
}

