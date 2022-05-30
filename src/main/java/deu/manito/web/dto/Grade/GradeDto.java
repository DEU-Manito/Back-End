package deu.manito.web.dto.Grade;

import deu.manito.web.entity.Grade;
import lombok.*;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GradeDto {

    private long   id;
    private String nickname;
    private int    score;

    public static GradeDto createGradeDto(Grade grade) {
        return GradeDto.builder()
                .id(grade.getId())
                .nickname(grade.getNickname())
                .score(grade.getScore())
                .build();
    }
}
