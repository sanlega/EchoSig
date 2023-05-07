package com.example.springbootdocker.controller;

import com.example.springbootdocker.service.EventService;
import com.example.springbootdocker.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.sql.DataSource;

@RestController
@RequestMapping("/event")
public class EventController {

    private final EventService eventService;

    public EventController(DataSource dataSource) {
        this.eventService = new EventService(dataSource);
    }

    @GetMapping
    public ResponseEntity<?> getEvents() {
        return eventService.getEvents();
    }

    @GetMapping(value = "/{nodeId}")
    public ResponseEntity<?> getEvent(@PathVariable("nodeId") int nodeId) {
        return eventService.getEvent(nodeId);
    }

    @PostMapping(value = "/{nodeId}")
    public ResponseEntity<?> postEvent(@PathVariable("nodeId") int nodeId) {
        return eventService.postEvent(nodeId);
    }
}
