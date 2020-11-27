/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BewareDatabase;

import BewareBean.Tag;
import BewareBean.Tag_task;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Mystery-PC
 */
public class TagDao {
    public int addTag(Tag tag) throws ClassNotFoundException {
        String query = "INSERT INTO tag" +
            "  (id, TagName, idUser) VALUES " +
            " (?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/bewaretaskasp?useSSL=false", "root", "");


            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, tag.getId());
            preparedStatement.setString(2, tag.getTagName());
            preparedStatement.setInt(3, tag.getIdUser());

            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    
    public int deleteTag(Tag_task tag_task) throws ClassNotFoundException {
        String query = "DELETE FROM tag" +
            " WHERE id = ?;";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/bewaretaskasp?useSSL=false", "root", "");


            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, tag_task.getTag_id());

            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    
    public int addTag_task(Tag_task tag_task) throws ClassNotFoundException
    {
        String query = "INSERT INTO tag_task" +
            "  (task_id, tag_id) VALUES " +
            " (?, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/bewaretaskasp?useSSL=false", "root", "");


            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, tag_task.getTask_id());
            preparedStatement.setInt(2, tag_task.getTag_id());

            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    
    public int deleteTag_task(Tag_task tag_task) throws ClassNotFoundException
    {
        String query = "DELETE FROM tag_task" +
            " WHERE tag_id = ?;";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/bewaretaskasp?useSSL=false", "root", "");


            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, tag_task.getTag_id());

            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
