package deu.manito.web.apiController;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.dto.user.UserDto;
import deu.manito.web.dto.user.UserPointDto;
import deu.manito.web.entity.Article;
import deu.manito.web.entity.User;
import deu.manito.web.service.ArticleService;
import deu.manito.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.Objects;


@Slf4j
@RestController
public class ArticleApiController {

    private ArticleService articleService;
    private UserService userService;

    public ArticleApiController(ArticleService articleService, UserService userService){//
        this.articleService = articleService;
        this.userService = userService;
    }


    // 게시글 작성
    @PostMapping("/api/articles/create")
    public ResponseEntity<ArticleDto> createArticle(@RequestBody ArticleDto articleDto){

        // 생성 날짜를 현재 시각으로 지정
        articleDto.setCreateTime(new Date(new java.util.Date().getTime()));

        // 금액 처리위한 UserPointDto 생성
        UserPointDto userPointDto = UserPointDto.createUserPointDto(articleDto);

        // 금액 차감
        userService.withdrawPoint(userPointDto);

        // 생성
        ArticleDto target = articleService.createArticle(articleDto);

        return ResponseEntity.status(HttpStatus.OK).body(target);
    }
    // 게시글 조회
    @PostMapping("/api/articles/{id}")
    public ResponseEntity<ArticleDto> readArticle(@RequestBody ArticleDto articleDto){

        ArticleDto target = articleService.readArticle(articleDto);

        return (target != null) ?
                ResponseEntity.status(HttpStatus.OK).body(target) :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }


    // 게시글 수정
    @PatchMapping("/api/articles/{id}/update")
    public ResponseEntity<ArticleDto> updateArticle(@RequestBody ArticleDto articleDto){

        articleDto.setCreateTime(new Date(new java.util.Date().getTime()));

        ArticleDto target = articleService.updateArticle(articleDto);
        log.info(articleDto.toString());

        return (target != null) ?
                ResponseEntity.status(HttpStatus.OK).body(target) :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

    // 게시글 삭제
    @PostMapping("/api/articles/{id}/delete")
    public ResponseEntity<ArticleDto> deleteArticle(@RequestBody ArticleDto articleDto){

        ArticleDto target = articleService.deleteArticle(articleDto);

        // 삭제되면 entity 반환 / 삭제할 게시글 없으면 null
        return (target != null) ?
                ResponseEntity.status(HttpStatus.OK).body(target) :
                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

    }


}

