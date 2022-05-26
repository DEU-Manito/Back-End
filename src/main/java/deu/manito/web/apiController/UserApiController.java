package deu.manito.web.apiController;


import deu.manito.web.dto.user.UserDto;
import deu.manito.web.dto.user.UserLocationDto;
import deu.manito.web.dto.user.UserLoginDto;
import deu.manito.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Slf4j
@RestController
public class UserApiController {

    private UserService userService;

    public UserApiController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/api/user/login")
    public ResponseEntity<UserDto> userlogin(@RequestBody UserLoginDto userLoginDto, HttpServletRequest request){

        UserDto userDto = userService.login(userLoginDto);

        HttpSession session = request.getSession();
        session.setAttribute("user", userDto);

        return ResponseEntity.status(HttpStatus.OK).body(userDto);
    }

    @GetMapping("/api/user/logout")
    public ResponseEntity<UserDto> userlogout(HttpServletRequest request){
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("user");

        log.info(userDto.toString());

        if(userDto != null) {
            session.removeAttribute("user");
            return ResponseEntity.status(HttpStatus.OK).body(userDto);
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    @PostMapping("/api/user/location")
    public ResponseEntity<UserLocationDto> addUserLocation(@RequestBody UserLocationDto userLocationDto, HttpServletRequest request){
        // 사용자의 위치 정보가 제대로 들어오지 않았을 경우
        if(Objects.isNull(userLocationDto)) return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        HttpSession session = request.getSession();
        session.setAttribute("userLocation", userLocationDto);

        return ResponseEntity.status(HttpStatus.OK).build();
    }
}
