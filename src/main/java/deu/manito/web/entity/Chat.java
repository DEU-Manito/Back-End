package deu.manito.web.entity;


import deu.manito.web.dto.chat.ChatDto;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;

@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column private String  title;
    @Column private String  roomId;
    @Column private Double  lat; //위도
    @Column private Double  lng; //경도
    @Column private Date    createTime;

    public static Chat toEntity(ChatDto dto){
        return Chat.builder()
                .title(dto.getTitle())
                .roomId(dto.getRoomId())
                .lat(dto.getLat())
                .lng(dto.getLng())
                .createTime(dto.getCreateTime())
                .build();
    }
}
