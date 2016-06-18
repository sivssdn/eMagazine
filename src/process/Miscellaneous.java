package process;

import database.DatabaseManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class Miscellaneous {
    String title;
    String content;

    public String getTitle(){
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public List<Miscellaneous> getAllMiscellaneous(String area, String month, int year){

        DatabaseManager db = new DatabaseManager();
        List<Miscellaneous> allMiscellaneousContent = new LinkedList<>();

        if(db.success.intern() == "success"){
            String selectStatement = "SELECT month, year, status, title, area, title_kannada, serial, miscellaneous_content, miscellaneous_content_kannada, link" +
                    "  FROM emagazine.public.miscellaneous WHERE status ILIKE 'APPROVED' AND month = lower(?) AND year = ? AND area = ?;";

            try{
                PreparedStatement statement = db.con.prepareStatement(selectStatement);
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);

                ResultSet miscellaneousRowsInDB = db.select(statement);
                while (miscellaneousRowsInDB.next()){
                    Miscellaneous row = new Miscellaneous();
                    row.setTitle(miscellaneousRowsInDB.getString("title"));
                    row.setContent(miscellaneousRowsInDB.getString("miscellaneous_content"));
                    allMiscellaneousContent.add(row);
                }
                miscellaneousRowsInDB.close(); //closing resultset

            }catch(SQLException se){
                    se.printStackTrace();
            }

        }
        db.close();

        return allMiscellaneousContent;
    }
// 5 , newsf - 8 , other - 5 , misce - 5, recent articles-10

    public void declareMiscellaneous(String month, int year, String area, DatabaseManager db){

        try {
            PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.miscellaneous(" +
                    "            month, year, status, title, area, title_kannada, serial, miscellaneous_content, " +
                    "            miscellaneous_content_kannada, link)" +
                    "    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");

            for (int i=1; i<5; i++){
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, "editting");
                statement.setString(4, " ");
                statement.setString(5, area);
                statement.setString(6, " ");
                statement.setInt(7, i);
                statement.setString(8, " ");
                statement.setString(9, " ");
                statement.setString(10, " ");

                db.insert(statement);

            }
        }catch(SQLException se){
            se.printStackTrace();
        }

    }
}
