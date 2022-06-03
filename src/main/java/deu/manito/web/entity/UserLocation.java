package deu.manito.web.entity;


import deu.manito.web.dto.user.UserLocationAuthDto;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;

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

    @Column private String nickname;        // Nickname 유니크로 설정
    @Column private Double lat;
    @Column private Double lng;

    @Column
    @CreationTimestamp
    private Timestamp createTime;

    public static UserLocation toEntity(UserLocationAuthDto dto){
        return UserLocation.builder()
                .nickname(dto.getNickname())
                .lat(dto.getLat())
                .lng(dto.getLng())
                .build();
    }

    public UserLocation patch(UserLocationAuthDto dto){
        this.lat = dto.getLat();
        this.lng = dto.getLng();

        return this;
    }
}
