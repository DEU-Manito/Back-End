package deu.manito.web.dto.user;


import lombok.*;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
public class UserUpdateDto {
    private String prevNickname;
    private String nextNickname;
}
