package com.example.springbootdocker.service;

import com.example.springbootdocker.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    DataSource dataSource;
    public UserService(DataSource dataSource){
        this.dataSource = dataSource;
    }

    public ResponseEntity<?> getUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             CallableStatement statement = connection.prepareCall("{CALL GetUsers()}")) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                User user = new User(
                        resultSet.getInt("userId"),
                        resultSet.getString("username"),
                        resultSet.getString("email"),
                        resultSet.getString("password"));
                users.add(user);
            }
            return new ResponseEntity<>(users, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<?> getUser(int userId) {
        User user = null;
        try (Connection connection = dataSource.getConnection();
             CallableStatement statement = connection.prepareCall("{CALL GetUser(?)}")) {
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User(
                        resultSet.getInt("userId"),
                        resultSet.getString("username"),
                        resultSet.getString("email"),
                        resultSet.getString("password"));
            }
            if (user != null) {
                return new ResponseEntity<>(user, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (SQLException e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<String> addUser(User user) {
        try (Connection connection = dataSource.getConnection();
             CallableStatement statement = connection.prepareCall("{CALL AddUser(?, ?, ?, ?)}")) {
            statement.setInt(1, user.getUserId());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.execute();
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<String> updateUser(User user) {
        try (Connection connection = dataSource.getConnection();
             CallableStatement statement = connection.prepareCall("{CALL UpdateUser(?, ?, ?, ?)}")) {
            statement.setInt(1, user.getUserId());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected == 0) {
                return new ResponseEntity<>("No rows were affected.", HttpStatus.BAD_REQUEST);
            }
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<String> deleteUser(int userId) {
        try (Connection connection = dataSource.getConnection();
             CallableStatement statement = connection.prepareCall("{CALL DeleteUser(?)}")) {
            statement.setInt(1, userId);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                return new ResponseEntity<>(HttpStatus.OK);
            } else {
                return new ResponseEntity<>("No rows affected", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (SQLException e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
