package deu.manito.web.entity;


import deu.manito.web.dto.user.UserLoginDto;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


/* 엔티티 클래스에는 세터 생성 x */
@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {

    @Id
    private String nickname;

    @Column
    private String email;

    @Column
    private String profile_image;

    @Column
    private String clientKey;

    @Column
    private String gender;

    @Column
    private Long reportCnt;

    @Column
    private Long point;



    public static User toEntity(UserLoginDto userLoginDto){
        return User.builder()
                .nickname(userLoginDto.getNickname())
                .email(userLoginDto.getEmail())
                .profile_image(userLoginDto.getProfile_image())
                .clientKey(userLoginDto.getClientKey())
                .gender(userLoginDto.getGender())
                .reportCnt(0L)
                .point(0L)
                .build();
    }
}
