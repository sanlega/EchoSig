package com.example.springbootdocker.controller.manage;

import com.example.springbootdocker.model.User;
import com.example.springbootdocker.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.sql.DataSource;
import java.util.List;

@RestController
@RequestMapping("/manage")
public class UserController {

    private final UserService userService;

    public UserController(DataSource dataSource) {
        this.userService = new UserService(dataSource);
    }

    @GetMapping(value = "/user")
    public ResponseEntity<?> getUsers() {
        return userService.getUsers();
    }

    @GetMapping(value = "/user/{userId}")
    public ResponseEntity<?> getUser(@PathVariable("userId") int userId) {
        return userService.getUser(userId);
    }

    @PostMapping(value = "/user")
    public ResponseEntity<String> addUser(@RequestBody User user) {
        return userService.addUser(user);
    }

    @PutMapping(value = "/user")
    public ResponseEntity<String> updateUser(@RequestBody User user) {
        return userService.updateUser(user);
    }

    @DeleteMapping(value = "/user/{userId}")
    public ResponseEntity<String> deleteUser(@PathVariable("userId") int userId) {
        return userService.deleteUser(userId);
    }
}
