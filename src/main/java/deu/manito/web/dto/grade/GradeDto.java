package deu.manito.web.dto.grade;

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
    private int    helpCnt;
    private double score;

    public static GradeDto createGradeDto(Grade grade) {
        return GradeDto.builder()
                .id(grade.getId())
                .nickname(grade.getNickname())
                .helpCnt(grade.getHelpCnt())
                .score(grade.getScore())
                .build();
    }
}
