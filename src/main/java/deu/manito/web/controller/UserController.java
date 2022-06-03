package deu.manito.web.controller;


import deu.manito.web.dto.grade.GradeDto;
import deu.manito.web.dto.user.UserDto;
import deu.manito.web.service.GradeService;
import deu.manito.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
* @package : deu.manito.web.controller
* @name : UserController.java
* @date : 2022-04-02 오후 4:03
* @author : Dong
**/
@Controller
@Slf4j
public class UserController {

    private UserService userService;
    private GradeService gradeService;

    public UserController(UserService userService, GradeService gradeService) {
        this.userService = userService;
        this.gradeService = gradeService;
    }

    @GetMapping("/profile/{nickname}") // 프로필 조회
    public String profile(@PathVariable String nickname, Model model){
        // 데이터  가져오기
        UserDto userDto = userService.getProfile(nickname);
        GradeDto gradeDto = gradeService.getUserGrade(nickname);

        //모델에 데이터 등록
        model.addAttribute("profile", userDto);
        model.addAttribute("grade", gradeDto);

        return "user/profile";
    }



}
