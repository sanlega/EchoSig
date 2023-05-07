package com.example.springbootdocker.model;

import java.sql.Time;

public class Event {
    private int nodeId;
    private String username;
    private String address;
    private int typeId;
    private String service;
    private Time time;

    public Event(int nodeId, String username, String address, String service, Time time) {
        this.nodeId = nodeId;
        this.username = username;
        this.address = address;
        this.service = service;
        this.time = time;
    }

    public int getNodeId() {
        return nodeId;
    }

    public void setNodeId(int nodeId) {
        this.nodeId = nodeId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }
}
