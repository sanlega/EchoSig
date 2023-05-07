package com.example.springbootdocker.service;

import com.example.springbootdocker.model.Event;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventService {
    DataSource dataSource;
    public EventService(DataSource dataSource){
        this.dataSource = dataSource;
    }

    public ResponseEntity<?> getEvents() {
        List<Event> events = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             CallableStatement statement = connection.prepareCall("{CALL GetEvents()}")) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Event event = new Event(
                        resultSet.getInt("nodeId"),
                        resultSet.getString("username"),
                        resultSet.getString("service"),
                        resultSet.getString("address"),
                        resultSet.getTime("time"));
                events.add(event);
            }
            return new ResponseEntity<>(events, HttpStatus.OK);
        } catch (SQLException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<?> getEvent(int nodeId) {
        Event event = null;
        try (Connection connection = dataSource.getConnection();
             CallableStatement statement = connection.prepareCall("{CALL GetEventInfo(?)}")) {
            statement.setInt(1, nodeId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                event = new Event(
                        resultSet.getInt("nodeId"),
                        resultSet.getString("username"),
                        resultSet.getString("service"),
                        resultSet.getString("address"),
                        resultSet.getTime("time"));
            }
            if (event != null) {
                return new ResponseEntity<>(event, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (SQLException e) {
            return new ResponseEntity<>(e.toString(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public ResponseEntity<String> postEvent(int nodeId) {
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
