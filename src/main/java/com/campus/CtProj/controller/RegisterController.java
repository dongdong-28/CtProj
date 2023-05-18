package com.campus.CtProj.controller;

import com.campus.CtProj.domain.UserDto;
import com.campus.CtProj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserService userService;

    @GetMapping("/add")
    public String register() {
        return "registerForm"; // WEB-INF/views/registerForm.jsp
    }


    @PostMapping("/add")
    public String save(UserDto userDto) throws Exception {

        System.out.println("userDto = " + userDto);
        System.out.println("userDto = " + userDto.getId());
        System.out.println("userDto = " + userDto.getPassword());
        System.out.println("userDto = " + userDto.getNickname());

        try{
            int rowCnt = userService.write(userDto);


        }
        catch(Exception e){
            e.printStackTrace();
            return "registerForm";

        }

        return "index";
    }


}