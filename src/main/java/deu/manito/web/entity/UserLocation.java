package deu.manito.web.entity;


import deu.manito.web.dto.user.UserLocationAuthDto;
import lombok.*;

import javax.persistence.*;

@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class UserLocation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column private String nickname;
    @Column private Double lat;
    @Column private Double lng;

    public static UserLocation toEntity(UserLocationAuthDto dto){
        return UserLocation.builder()
                .nickname(dto.getNickname())
                .lat(dto.getLat())
                .lng(dto.getLng())
                .build();
    }
}
