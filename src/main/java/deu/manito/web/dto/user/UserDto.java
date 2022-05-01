package deu.manito.web.dto.user;


import deu.manito.web.entity.User;
import lombok.*;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private String nickname;
    private String email;
    private String profile_image;
    private String gender;
    private Long reportCnt;
    private Long point;
    
    // User 엔티티 클래스를 UserDto 클래스로 변환
    public static UserDto createUserDto(User user){
        return UserDto.builder()
                .nickname(user.getNickname())
                .email(user.getEmail())
                .profile_image(user.getProfile_image())
                .gender(user.getGender())
                .reportCnt(user.getReportCnt())
                .point(user.getPoint())
                .build();
    }
}
