package deu.manito.web.entity;


import deu.manito.web.dto.user.UserDto;
import deu.manito.web.dto.user.UserLoginDto;
import deu.manito.web.dto.user.UserPointDto;
import deu.manito.web.dto.user.UserUpdateDto;
import lombok.*;

import javax.persistence.*;


/* 엔티티 클래스에는 세터 생성 x */
@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {

    @Id private String email;

    @Column private String nickname; // Email은 UNIQUE
    @Column private String profile_image;
    @Column private String clientKey;
    @Column private int reportCnt;
    @Column private int point;

    public static User toEntity(UserLoginDto userLoginDto){
        return User.builder()
                .email(userLoginDto.getEmail())
                .nickname(userLoginDto.getNickname())
                .profile_image(userLoginDto.getProfile_image())
                .clientKey(userLoginDto.getClientKey())
                .reportCnt(0)
                .point(0)
                .build();
    }


    public void patch(UserDto userDto){
        if(userDto.getNickname() != null)
            this.nickname = userDto.getNickname();

        this.point = userDto.getPoint();
    }

    public void patch(UserPointDto userPointDto){
            this.point = userPointDto.getPoint();
    }

    public void patch(UserUpdateDto userUpdateDto) {
        if(!"".equals(userUpdateDto.getNextNickname()))
            this.nickname = userUpdateDto.getNextNickname();
    }
}
