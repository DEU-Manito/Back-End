package deu.manito.web.entity;


import deu.manito.web.dto.user.UserLoginDto;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;


/* 엔티티 클래스에는 세터 생성 x */
@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {

    @Id
    private String email;

    @Column // Email은 UNIQUE
    private String nickname;

    @Column
    private String profile_image;

    @Column
    private String clientKey;

    @Column
    private Long reportCnt;

    @Column
    private Long point;

    public static User toEntity(UserLoginDto userLoginDto){
        return User.builder()
                .email(userLoginDto.getEmail())
                .nickname(userLoginDto.getNickname())
                .profile_image(userLoginDto.getProfile_image())
                .clientKey(userLoginDto.getClientKey())
                .reportCnt(0L)
                .point(0L)
                .build();
    }
}
