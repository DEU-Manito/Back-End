package deu.manito.web.service;


import deu.manito.web.dto.user.UserDto;
import deu.manito.web.dto.user.UserLoginDto;
import deu.manito.web.entity.User;
import deu.manito.web.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.UUID;

@Slf4j
@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public UserDto login(UserLoginDto userLoginDto){
        log.info(userLoginDto.toString());
        // 유저 정보 조회
        User user = userRepository.findById(userLoginDto.getNickname()).orElse(null);

        // 신규 유저면 DB에 등록
        if(Objects.isNull(user)) {
            // 최초 회원가입 시 clientKey 생성
            log.info("UserService : New User");
            userLoginDto.setClientKey(UUID.randomUUID().toString().substring(0, 8));
            user = userRepository.save(User.toEntity(userLoginDto));
        }

        // 유저 정보 리턴
        return UserDto.createUserDto(user);
    }
}
