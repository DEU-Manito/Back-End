package deu.manito.web.dto.chat;

import deu.manito.web.entity.Chat;
import lombok.*;

import java.sql.Date;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatDto {

    private String title;

    private String roomId;
    // 위도
    private Double lat;
    // 경도
    private Double lng;

    private Date createTime;

    public static ChatDto createChatDto(Chat chat){
        return ChatDto.builder()
                .title(chat.getTitle())
                .roomId(chat.getRoomId())
                .lat(chat.getLat())
                .lng(chat.getLng())
                .createTime(chat.getCreateTime())
                .build();
    }
}
