package deu.manito.web.apiController;


import deu.manito.web.dto.user.*;
import deu.manito.web.entity.UserLocation;
import deu.manito.web.service.UserLocationService;
import deu.manito.web.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
    @ApiOperation(value = "로그인")
    public ResponseEntity<UserDto> userlogin(@RequestBody UserLoginDto userLoginDto, HttpServletRequest request){

        UserDto userDto = userService.login(userLoginDto);

        HttpSession session = request.getSession();
        session.setAttribute("user", userDto);

        return ResponseEntity.status(HttpStatus.OK).body(userDto);
    }

    @GetMapping("/api/user/logout")
    @ApiOperation(value = "로그아웃")
    public ResponseEntity<UserDto> userlogout(HttpServletRequest request){
        HttpSession session = request.getSession();
        UserDto userDto = (UserDto) session.getAttribute("user");

        log.info(userDto.toString());

        if(userDto != null) {
            session.removeAttribute("user");
            session.removeAttribute("userLocation");

            // DB의 위치 정보도 같이 삭제
            userLocationService.removeLocation(userDto.getNickname());

            return ResponseEntity.status(HttpStatus.OK).body(userDto);
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    @PatchMapping("/api/user/rename")
    @ApiOperation(value = "사용자 닉네임 변경", notes = "사용자 닉네임을 변경합니다.")
    public ResponseEntity<UserDto> renameProfile(@RequestBody UserUpdateDto dto,  HttpServletRequest request){

        UserDto userDto = userService.renameProfile(dto);

        // 이름이 중복되면
        if(Objects.isNull(userDto))
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        HttpSession session = request.getSession();
        session.setAttribute("user", userDto);

        return ResponseEntity.status(HttpStatus.OK).body(userDto);
    }

    @PatchMapping("/api/user/deposit") // 포인트 입금
    @ApiOperation(value = "사용자 포인트 충전", notes = "사용자 포인트를 충전합니다.")
    public ResponseEntity<UserDto> depositPoint(@RequestBody UserPointDto userPointDto, HttpServletRequest request){

        UserDto userDto = userService.depositPoint(userPointDto);

        if(Objects.isNull(userDto))
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        // 유저 세션 갱신 (포인트 갱신)
        HttpSession session = request.getSession();
        session.setAttribute("user", userDto);

        return ResponseEntity.status(HttpStatus.OK).body(userDto);
    }

    @PatchMapping("/api/user/withdraw") // 포인트 출금
    @ApiOperation(value = "사용자 포인트 반환", notes = "사용자 포인트를 반환합니다.")
    public ResponseEntity<UserDto> withdrawPoint(@RequestBody UserPointDto userPointDto, HttpServletRequest request){

        UserDto userDto = userService.withdrawPoint(userPointDto);

        if(Objects.isNull(userDto))
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        // 유저 세션 갱신 (포인트 갱신)
        HttpSession session = request.getSession();
        session.setAttribute("user", userDto);

        return ResponseEntity.status(HttpStatus.OK).body(userDto);
    }

    @GetMapping("/api/user/{nickname}")
    public ResponseEntity<UserDto> getUser(@PathVariable String nickname){
        UserDto user = userService.getProfile(nickname);

        return Objects.isNull(user)
                ? null
                : ResponseEntity.status(HttpStatus.OK).body(user);
    }

}
