package deu.manito.web.service;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.dto.grade.GradeDto;
import deu.manito.web.dto.grade.GradeRateDto;
import deu.manito.web.dto.user.UserDto;
import deu.manito.web.dto.user.UserPointDto;
import deu.manito.web.entity.Grade;
import deu.manito.web.entity.User;
import deu.manito.web.repository.GradeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
public class GradeService {

    private GradeRepository gradeRepository;
    private ArticleService articleService;
    private UserService userService;

    public GradeService(GradeRepository gradeRepository, ArticleService articleService, UserService userService){
        this.gradeRepository = gradeRepository;
        this.articleService = articleService;
        this.userService = userService;
    }

    @Transactional
    public GradeDto rateGrade(GradeRateDto rateDto){

       Grade target = gradeRepository.findByNickname(rateDto.getNickname())
                                     .orElseThrow(()-> new IllegalArgumentException("유저 정보 조회 오류"));

        if(Objects.isNull(target)) return null;

        // 도움 점수 갱신
        rateDto.setScore(target.getScore() + rateDto.getScore());
        target.patch(rateDto);

        // 게시글 상태 완료로 변경
        ArticleDto articleDto = articleService.readArticle(rateDto.getArticleId());
        articleDto.setStatus("disabled");

        // 게시글 상태 업데이트
        ArticleDto article = articleService.updateArticle(articleDto.getId(), articleDto);

        // 도움 준 유저에게 포인트 지급
        UserPointDto userPointDto = UserPointDto.createUserPointDto(rateDto.getNickname(), article.getPoint());
        userService.depositPoint(userPointDto);

        return GradeDto.createGradeDto(target);
    }

    public GradeDto getUserGrade(String nickname){
        Grade grade = gradeRepository.findByNickname(nickname)
                                     .orElseThrow(()-> new IllegalArgumentException("유저 평점 조회 오류"));

        return GradeDto.createGradeDto(grade);
    }
}
