package deu.manito.web.dto.user;

import lombok.*;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserLocationDto {
    private Double lat;
    private Double lng;
}
