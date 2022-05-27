package deu.manito.web.dto.chat;

import deu.manito.web.entity.Chat;
import lombok.*;

import javax.persistence.Column;
import java.sql.Date;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatCreateDto {

    private String title;

    private String roomId;
    // 위도
    private Double lat;
    // 경도
    private Double lng;

    private Date createTime;

    public static Chat createChat(ChatCreateDto dto){
        return Chat.builder()
                .title(dto.getTitle())
                .roomId(dto.getRoomId())
                .lat(dto.getLat())
                .lng(dto.getLng())
                .createTime(dto.getCreateTime())
                .build();
    }
}
