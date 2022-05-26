package deu.manito.web.dto.chat;

import lombok.*;

import javax.persistence.Column;

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
}
