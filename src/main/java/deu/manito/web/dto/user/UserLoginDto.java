package deu.manito.web.dto.user;


import deu.manito.web.entity.User;
import lombok.*;


@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginDto {
    private String email;
    private String nickname;
    private String profile_image;
    private String clientKey;
}
