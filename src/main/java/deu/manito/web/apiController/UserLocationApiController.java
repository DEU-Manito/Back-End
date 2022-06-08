package deu.manito.web.apiController;


import deu.manito.web.dto.user.UserLocationAuthDto;
import deu.manito.web.dto.user.UserLocationDto;
import deu.manito.web.service.UserLocationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Slf4j
@Controller
public class UserLocationApiController {
    private UserLocationService userLocationService;

    public UserLocationApiController(UserLocationService userLocationService) {
        this.userLocationService = userLocationService;
    }

    @PostMapping("/api/user/location") // 유저 위치 정보를 세션에 등록하는 메소드
    @ApiOperation(value = "사용자 위치 등록", notes = "사용자의 위치 정보를 등록합니다.")
    public ResponseEntity<UserLocationDto> addUserLocation(@RequestBody UserLocationDto userLocationDto, HttpServletRequest request){
        // 사용자의 위치 정보가 제대로 들어오지 않았을 경우
        if(Objects.isNull(userLocationDto)) return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        HttpSession session = request.getSession();
        session.setAttribute("userLocation", userLocationDto);

        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/api/user/location/auth") // 모바일의 위치 정보를 DB에 등록하는 메소드
    @ApiOperation(value = "사용자 위치 인증(모바일)", notes = "모바일로 인증 받은 사용자 위치 정보를 저장합니다.")
    public ResponseEntity<UserLocationAuthDto> authMobileLocation(@RequestBody UserLocationAuthDto dto, HttpServletRequest request){
        UserLocationAuthDto result = userLocationService.authMobileLocation(dto);

        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/api/user/location/auth/{nickname}") // PC 위치 인증 메소드
    @ApiOperation(value = "사용자 위치 인증(PC)", notes = "모바일로 인증 받은 사용자의 위치 정보를 PC와 연동합니다.")
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
