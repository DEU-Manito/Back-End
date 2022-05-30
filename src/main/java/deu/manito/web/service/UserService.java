package deu.manito.web.service;


import deu.manito.web.dto.user.UserDto;
import deu.manito.web.dto.user.UserLocationAuthDto;
import deu.manito.web.dto.user.UserLoginDto;
import deu.manito.web.dto.user.UserRenameDto;
import deu.manito.web.entity.User;
import deu.manito.web.entity.UserLocation;
import deu.manito.web.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;
import java.util.UUID;

/**
* @package : deu.manito.web.service
* @name : UserService.java
* @date : 2022-05-22 오후 1:05
* @author : Dong
**/

@Slf4j
@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional
    public UserDto login(UserLoginDto userLoginDto){
        log.info(userLoginDto.toString());
        // 유저 정보 조회
        User user = userRepository.findById(userLoginDto.getEmail()).orElse(null);

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


    // 프로필(내 정보) 가져오기
    public UserDto getProfile(UserDto userDto) {
        User user = userRepository.findById(userDto.getNickname()).orElse(null);

        return UserDto.createUserDto(user);
    }




    @Transactional  //이름 변경
    public UserDto renameProfile(UserRenameDto userRenameDto) {

        // 변경할 닉네임 중복 체크
        Boolean check = userRepository.existsById(userRenameDto.getAfterNickname());

        if(check==false) {  // 중복된 닉네임이 없다면

            // 수정할 유저 정보 가져오기
            User target = userRepository.findById(userRenameDto.getBeforeNickname()).orElse(null);

            target.patch(userRenameDto);

            return UserDto.createUserDto(target);
        }

        else    // 중복된 닉네임이 있다면
            return null;
    }


    @Transactional  // 포인트 충전
    public UserDto depositPoint(UserDto userDto) {

        //충전할 유저 정보 가져오기
        User target = userRepository.findById(userDto.getNickname()).orElse(null);

        if(Objects.isNull(target))
            return null;


        //충전할 금액
        userDto.setPoint(userDto.getPoint()+target.getPoint()); // 충전 후 금액
        target.patch(userDto);

        return UserDto.createUserDto(target);

    }

    @Transactional  // 포인트 출금
    public UserDto withdrawPoint(UserDto userDto) {

        //출금할 유저 정보 가져오기
        User target = userRepository.findById(userDto.getNickname()).orElse(null);

        if(Objects.isNull(target))
            return null;


        //출금할 금액
        userDto.setPoint(target.getPoint() - userDto.getPoint()); // 충전 후 금액
        target.patch(userDto);

        return UserDto.createUserDto(target);
    }


}
