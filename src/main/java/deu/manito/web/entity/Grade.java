package deu.manito.web.entity;


import deu.manito.web.dto.grade.GradeDto;
import deu.manito.web.dto.grade.GradeRateDto;
import lombok.*;

import javax.persistence.*;

/* 엔티티 클래스에는 세터 생성 x */
@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column private String nickname;
    @Column private double score;
    @Column private int    helpCnt;


    public void patch(GradeRateDto rateDto) {
        this.score = rateDto.getScore();
        this.helpCnt = this.helpCnt+1;
    }
}
