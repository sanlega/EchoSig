package com.example.springbootdocker.controller.manage;

import com.example.springbootdocker.model.User;
import com.example.springbootdocker.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public List<User> getUsers() {
        return userService.getUsers();
    }
}
