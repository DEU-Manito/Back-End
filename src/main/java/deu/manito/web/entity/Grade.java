package deu.manito.web.entity;


import deu.manito.web.dto.Grade.GradeDto;
import deu.manito.web.dto.user.UserRenameDto;
import lombok.*;

import javax.persistence.*;
import java.util.Objects;

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
    @Column private int    score;
    @Column private int    helpCnt;


    public void patch(GradeDto gradeDto) {
                this.score = gradeDto.getScore();
                this.helpCnt = gradeDto.getHelpCnt();

    }
}
