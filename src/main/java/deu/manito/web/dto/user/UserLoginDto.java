package deu.manito.web.dto.user;


import lombok.*;


@Getter
@ToString
@Builder
@AllArgsConstructor
public class UserLoginDto {
    private String nickname;
    private String email;
    private String profile_image;
    private String gender;
}
