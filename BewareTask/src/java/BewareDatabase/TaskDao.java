/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BewareDatabase;

import BewareBean.Task;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ignatius Dwiki I
 */
public class TaskDao {
    public int addTask(Task task) throws ClassNotFoundException{
        String query = "INSERT INTO task" +
            "  (id, taskName, deadline, idUser) VALUES " +
            " (?, ?, ?, ?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/bewaretaskasp?useSSL=false", "root", "");

            
            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, task.getId());
            preparedStatement.setString(2, task.getTaskName());
            preparedStatement.setDate(3, task.getDeadline());
            preparedStatement.setInt(4, task.getIdUser());

            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }
    
    public int editTask(Task task) throws ClassNotFoundException{
        String query = "UPDATE task" +
            "  SET TaskName = ?, deadline = ?" +
            " WHERE id = ?;";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/bewaretaskasp?useSSL=false", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, task.getTaskName());
            preparedStatement.setDate(2, task.getDeadline());
            preparedStatement.setInt(3, task.getId());

            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }
    
    public int deleteTask(Task task) throws ClassNotFoundException{
        String query = "DELETE FROM task" +
            " WHERE id = ?;";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/bewaretaskasp?useSSL=false", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, task.getId());

            System.out.println(preparedStatement);
            
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
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
