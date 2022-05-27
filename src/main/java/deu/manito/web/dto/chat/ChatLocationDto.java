package deu.manito.web.dto.chat;


import lombok.*;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatLocationDto {

    private Double lat;
    private Double lng;
}
