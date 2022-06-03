package deu.manito.web.service;

import deu.manito.web.dto.grade.GradeDto;
import deu.manito.web.entity.Grade;
import deu.manito.web.repository.GradeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
public class GradeService {

    private GradeRepository gradeRepository;

    public GradeService(GradeRepository gradeRepository){ this.gradeRepository = gradeRepository; }

    @Transactional
    public GradeDto rateGrade(GradeDto gradeDto){

       Grade target = gradeRepository.findByNickname(gradeDto.getNickname()).orElse(null);

        if(Objects.isNull(target))
            return null;

        // 점수 더 해주기
        gradeDto.setScore(target.getScore() + gradeDto.getScore());
        target.patch(gradeDto);

        return GradeDto.createGradeDto(target);
    }

    public GradeDto getUserGrade(String nickname){
        Grade grade = gradeRepository.findByNickname(nickname)
                                     .orElseThrow(()-> new IllegalArgumentException("유저 평점 조회 오류"));

        return GradeDto.createGradeDto(grade);
    }
}
