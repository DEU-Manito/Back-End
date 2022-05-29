package deu.manito.web.apiController;


import deu.manito.web.dto.user.UserLocationAuthDto;
import deu.manito.web.dto.user.UserDto;
import deu.manito.web.dto.user.UserLocationDto;
import deu.manito.web.dto.user.UserLoginDto;
import deu.manito.web.entity.UserLocation;
import deu.manito.web.service.UserLocationService;
import deu.manito.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
* @package : deu.manito.web.apiController
* @name : UserApiController.java
* @date : 2022-05-28 오후 4:02
* @author : Dong
**/

@Slf4j
@RestController
public class UserApiController {

    private UserService userService;
    private UserLocationService userLocationService;

    public UserApiController(UserService userService, UserLocationService userLocationService) {
        this.userService = userService;
        this.userLocationService = userLocationService;
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
            session.removeAttribute("userLocation");
            return ResponseEntity.status(HttpStatus.OK).body(userDto);
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    @PostMapping("/api/user/location") // 유저 위치 정보를 세션에 등록하는 메소드
    public ResponseEntity<UserLocationDto> addUserLocation(@RequestBody UserLocationDto userLocationDto, HttpServletRequest request){
        // 사용자의 위치 정보가 제대로 들어오지 않았을 경우
        if(Objects.isNull(userLocationDto)) return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        HttpSession session = request.getSession();
        session.setAttribute("userLocation", userLocationDto);

        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/api/user/location/auth") // 모바일의 위치 정보를 DB에 등록하는 메소드
    public ResponseEntity<UserLocationAuthDto> authMobileLocation(@RequestBody UserLocationAuthDto dto, HttpServletRequest request){
        UserLocationAuthDto result = userLocationService.authMobileLocation(dto);
        
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/api/user/location/auth/{nickname}") // PC 위치 인증 메소드
    public ResponseEntity<UserLocationAuthDto> authPcLocation(@PathVariable String nickname, HttpServletRequest request){
        log.info(nickname);
        UserLocationAuthDto result = userLocationService.authPcLocation(nickname);

        // DB에 유저 위치 정보가 있는 경우
        if(!Objects.isNull(result)) {
            UserLocationDto userLocation = new UserLocationDto(result.getLat(), result.getLng());
            // 세션에 유저의 위치 정보를 등록
            HttpSession session = request.getSession();
            session.setAttribute("userLocation", userLocation);
        }

        return Objects.isNull(result)
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(result);
    }
}
