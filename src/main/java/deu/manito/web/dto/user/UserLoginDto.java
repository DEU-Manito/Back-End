package deu.manito.web.dto.user;


import deu.manito.web.entity.User;
import lombok.*;


@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
public class UserLoginDto {
    private String nickname;
    private String email;
    private String profile_image;
    private String clientKey;
    private String gender;
}
