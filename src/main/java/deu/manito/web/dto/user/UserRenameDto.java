package deu.manito.web.dto.user;


import deu.manito.web.entity.User;
import lombok.*;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
public class UserRenameDto {
    private String beforeNickname;
    private String afterNickname;


}


