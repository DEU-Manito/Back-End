package deu.manito.web.apiController;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.dto.grade.GradeDto;
import deu.manito.web.dto.grade.GradeRateDto;
import deu.manito.web.entity.Article;
import deu.manito.web.entity.User;
import deu.manito.web.service.ArticleService;
import deu.manito.web.service.GradeService;
import deu.manito.web.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
public class GradeApiController {
    private GradeService gradeService;

    public GradeApiController(GradeService gradeService){
        this.gradeService = gradeService;
    }

    @PatchMapping("/api/grade/rate")
    @ApiOperation(value = "사용자 평점 등록", notes = "도움을 준 사용자의 평점을 등록합니다.")
    public ResponseEntity<GradeDto> rateGrade(@RequestBody GradeRateDto rateDto){

        GradeDto result = gradeService.rateGrade(rateDto);

        // 게시글이 Null이 아니면 성공
        return Objects.isNull(result)
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(result);
    }
}
