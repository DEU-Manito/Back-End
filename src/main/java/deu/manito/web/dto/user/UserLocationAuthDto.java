package deu.manito.web.dto.user;

import deu.manito.web.entity.User;
import deu.manito.web.entity.UserLocation;
import lombok.*;

/**
* @package : deu.manito.web.dto.user
* @name : UserLocationAuthDto.java
* @date : 2022-05-29 오전 4:11
* @author : Dong
**/
@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserLocationAuthDto {
    private String nickname;
    private Double lat;
    private Double lng;

    public static UserLocationAuthDto createUserLocationAuthDto(UserLocation entity){
        return UserLocationAuthDto.builder()
                .nickname(entity.getNickname())
                .lat(entity.getLat())
                .lng(entity.getLng())
                .build();
    }
}
