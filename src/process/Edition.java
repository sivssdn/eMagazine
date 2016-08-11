package process;

import database.DatabaseManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Edition {

    public Events event;
    public NewsFeed news;
    public Stories story;
    public MostReadArticles article;
    public Miscellaneous miscell;

    public void editionArea(String area){
        switch(area){
            case "abc" :

        }
    }
    /**
     * responsible for creating new edition, takes input as month, year and area for which the new edition needs to be created
     * */
    public void createEdition(String month, int year, String area) {
        DatabaseManager db = new DatabaseManager();
        if (db.success.intern() == "success") {
            try {
                PreparedStatement statement = db.con.prepareStatement("INSERT INTO emagazine.public.editions(month, year, area, status) VALUES (lower(?), ?, ?, ?);");
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setString(4, "editing");

                db.insert(statement);

                //declare events
                event = new Events();
                event.declareEvent(month, year, area, db);
                news = new NewsFeed();
                news.declareNewsFeed(month, year, area, db);
                story = new Stories();
                story.declareStories(month, year, area, db);
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

    /**
     * check if the edition already exists
     * */
    public boolean editionExists(String month, int year, String area, String status) {
        DatabaseManager db = new DatabaseManager();
        boolean exists = false;
        if (db.success.intern() == "success") {
            try {
                PreparedStatement statement = db.con.prepareStatement("SELECT area FROM emagazine.public.editions WHERE month = lower(?) AND year = ? AND area = ? AND status = lower(?);");
                statement.setString(1, month);
                statement.setInt(2, year);
                statement.setString(3, area);
                statement.setString(4, status);
                ResultSet editionsInDb = db.select(statement);

                while (editionsInDb.next()) //ideally should only be one
                {
                    exists = true;
                }
                editionsInDb.close();
            } catch (SQLException se) {
                se.printStackTrace();
                return true; //to prevent creating new editions in case of database exceptions
            }
        }
        db.close();
        return exists;
    }

    /**
     * used for approving edition corresponding to input month, year and area
     * */
    public boolean approveEdition(String month, int year, String area) {
        DatabaseManager db = new DatabaseManager();
        if (db.success.intern() == "success") {
            String updateEdition = "UPDATE public.editions SET status='approved' WHERE month=lower(?) AND year=? AND area=?;";
            String updateEvents = "UPDATE emagazine.public.events SET status='approved' WHERE month=lower(?) AND year=? AND area=?;";
            String updateMostRead = "UPDATE emagazine.public.most_read_articles SET status='approved' WHERE month=lower(?) AND year=? AND area=?;";
            String updateMiscellaneous = "UPDATE emagazine.public.miscellaneous SET status='approved' WHERE month=lower(?) AND year=? AND area=?;";
            String updateOtherStories = "UPDATE emagazine.public.other_stories SET status='approved' WHERE month=lower(?) AND year=? AND area=?;";
            String updateNewsFeed = "UPDATE emagazine.public.news_feed SET status='approved' WHERE month=lower(?) AND year=? AND area=?;";

            try {

                PreparedStatement preparedEditionUpdate = db.con.prepareStatement(updateEdition);
                PreparedStatement preparedEventUpdate = db.con.prepareStatement(updateEvents);
                PreparedStatement preparedMiscellaneousUpdate = db.con.prepareStatement(updateMiscellaneous);
                PreparedStatement preparedOtherStoriesUpdate = db.con.prepareStatement(updateOtherStories);
                PreparedStatement preparedMostReadUpdate = db.con.prepareStatement(updateMostRead);
                PreparedStatement preparedNewsFeedUpdate = db.con.prepareStatement(updateNewsFeed);

                preparedEditionUpdate.setString(1, month);
                preparedEditionUpdate.setInt(2, year);
                preparedEditionUpdate.setString(3, area);

                preparedEventUpdate.setString(1, month);
                preparedEventUpdate.setInt(2, year);
                preparedEventUpdate.setString(3, area);

                preparedMiscellaneousUpdate.setString(1, month);
                preparedMiscellaneousUpdate.setInt(2, year);
                preparedMiscellaneousUpdate.setString(3, area);

                preparedOtherStoriesUpdate.setString(1, month);
                preparedOtherStoriesUpdate.setInt(2, year);
                preparedOtherStoriesUpdate.setString(3, area);

                preparedMostReadUpdate.setString(1, month);
                preparedMostReadUpdate.setInt(2, year);
                preparedMostReadUpdate.setString(3, area);

                preparedNewsFeedUpdate.setString(1, month);
                preparedNewsFeedUpdate.setInt(2, year);
                preparedNewsFeedUpdate.setString(3, area);

                db.update(preparedEditionUpdate);
                db.update(preparedEventUpdate);
                db.update(preparedMiscellaneousUpdate);
                db.update(preparedOtherStoriesUpdate);
                db.update(preparedMostReadUpdate);
                db.update(preparedNewsFeedUpdate);

            } catch (SQLException se) {
                se.printStackTrace();
                return false;
            }
        }
        db.close();
        return true;
    }
}
