package deu.manito.web.service;


import deu.manito.web.dto.user.*;
import deu.manito.web.entity.Grade;
import deu.manito.web.entity.User;
import deu.manito.web.entity.UserLocation;
import deu.manito.web.repository.GradeRepository;
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
    private final GradeRepository gradeRepository;

    public UserService(UserRepository userRepository, GradeRepository gradeRepository) {
        this.userRepository = userRepository;
        this.gradeRepository = gradeRepository;
    }

    @Transactional
    public UserDto login(UserLoginDto userLoginDto){
        log.info(userLoginDto.toString());
        // 유저 정보 조회
        User user = userRepository.findById(userLoginDto.getEmail()).orElse(null);

        // 신규 유저면 DB에 등록
        if(Objects.isNull(user)) {
            // 최초 회원가입 시 clientKey 생성
            userLoginDto.setClientKey(UUID.randomUUID().toString().substring(0, 8));
            user = userRepository.save(User.toEntity(userLoginDto));

            Grade grade = gradeRepository.save(Grade.builder()
                                        .nickname(user.getNickname())
                                        .helpCnt(0)
                                        .score(0)
                                        .build());
        }

        // 유저 정보 리턴
        return UserDto.createUserDto(user);
    }

    // 프로필(내 정보) 가져오기
    public UserDto getProfile(String nickname) {
        User user = userRepository.findByNickname(nickname)
                                  .orElseThrow(()-> new IllegalArgumentException("유저 정보 조회 오류"));

        return UserDto.createUserDto(user);
    }

//    @Transactional
//    public UserDto updateUser(UserUpdateDto updateDto){
//        // 닉네임은 변경 될 수 있으므로 변경 전 닉네임으로 검색
//        User user = userRepository.findByNickname(updateDto.getPrevNickname())
//                                                           .orElseThrow(()-> new IllegalArgumentException("유저 정보 조회 오류"));
//
//        user.patch(updateDto);
//
//        return UserDto.createUserDto(user);
//    }

    @Transactional  //이름 변경
    public UserDto renameProfile(UserUpdateDto userDto) {

        // 변경할 닉네임 중복 체크
        Boolean check = userRepository.existsById(userDto.getNextNickname());
        
        // 중복된 유저가 존재하면 null 리턴
        if(check) return null;

        // 수정할 유저 정보 가져오기 (이전 정보를
        User target = userRepository.findByNickname(userDto.getPrevNickname()).orElse(null);

        if(Objects.isNull(target)) return null;

        target.patch(userDto);

        return UserDto.createUserDto(target);
    }


    @Transactional  // 포인트 충전
    public UserDto depositPoint(UserPointDto userPointDto) {

        //충전할 유저 정보 가져오기
        User target = userRepository.findByNickname(userPointDto.getNickname()).orElse(null);

        if(Objects.isNull(target))
            return null;

        //충전할 금액
        userPointDto.setPoint(target.getPoint() + userPointDto.getPoint()); // 충전  금액
        target.patch(userPointDto);

        return UserDto.createUserDto(target);
    }

    @Transactional  // 포인트 출금
    public UserDto withdrawPoint(UserPointDto userPointDto) {
        //출금할 유저 정보 가져오기
        User target = userRepository.findByNickname(userPointDto.getNickname())
                                    .orElseThrow(()-> new IllegalArgumentException("유저 포인트 출금 오류"));

        //출금할 금액
        if(target.getPoint() < userPointDto.getPoint()) throw new IllegalArgumentException("유저 포인트 출금 오류");

        userPointDto.setPoint(target.getPoint() - userPointDto.getPoint());
        target.patch(userPointDto);

        return UserDto.createUserDto(target);
    }
}
