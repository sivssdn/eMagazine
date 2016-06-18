package process;

import database.DatabaseManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Edition {
    String month;
    int year;
    String area;
    public Events event;
    public NewsFeed news;
    public Stories story;
    public MostReadArticles article;
    public Miscellaneous miscell;

    public void createEdition(String month,int year,String area){
        DatabaseManager db = new DatabaseManager();
        if (db.success.intern() == "success") {
            try {
                PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.editions(month, year, area, status) VALUES (lower(?), ?, ?, ?);");
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setString(4, "editting");

                db.insert(statement);

                //declare events
                event = new Events();
                event.declareEvent(month, year, area, db);
                news = new NewsFeed();
                news.declareNewsFeed(month, year, area, db);
                story = new Stories();
                story.declareEvent(month, year, area, db);
                article = new MostReadArticles();
                article.declareEvent(month, year, area, db);
                miscell = new Miscellaneous();
                miscell.declareMiscellaneous(month, year, area, db);

            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        db.close();
    }

    public boolean editionExists(String month,int year,String area){
        DatabaseManager db = new DatabaseManager();
        boolean exists = false;
        if(db.success.intern() == "success"){
            try {
                PreparedStatement statement = db.con.prepareStatement("SELECT area FROM public.editions WHERE month = lower(?) AND year = ? AND area = ?;");
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                ResultSet editionsInDb = db.select(statement);

                        while (editionsInDb.next()) //ideally should only be one
                        {
                                exists = true;
                        }
                editionsInDb.close();
            }catch(SQLException se){
                return true; //to prevent creating new editions in case of database exceptions
            }
        }
        db.close();
        return exists;
    }
}
