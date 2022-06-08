package deu.manito.web.dto.grade;


import lombok.*;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GradeRateDto {
    private String nickname;
    private double score;
    private Long articleId;
}
