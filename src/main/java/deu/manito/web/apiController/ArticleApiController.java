package deu.manito.web.apiController;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.service.ArticleService;
import deu.manito.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

        // 생성
        ArticleDto target = articleService.createArticle(articleDto);

        return Objects.isNull(target)
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);
    }

    // 게시글 조회
    @GetMapping("/api/articles/{articleId}")
    public ResponseEntity<ArticleDto> readArticle(@PathVariable Long articleId){

        ArticleDto target = articleService.readArticle(articleId);

        return (Objects.isNull(target))
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);

    }


    // 게시글 수정
    @PatchMapping("/api/articles/{articleId}")
    public ResponseEntity<ArticleDto> updateArticle(@PathVariable Long articleId, @RequestBody ArticleDto articleDto){

        articleDto.setCreateTime(new Date(new java.util.Date().getTime()));

        // 포인트 수정도 같이 필요
        ArticleDto target = articleService.updateArticle(articleId, articleDto);

        log.info(articleDto.toString());

        return (Objects.isNull(target))
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);
    }

    // 게시글 삭제
    @DeleteMapping("/api/articles/{articleId}")
    public ResponseEntity<ArticleDto> deleteArticle(@PathVariable Long articleId){

        ArticleDto target = articleService.deleteArticle(articleId);

        // 삭제되면 entity 반환 / 삭제할 게시글 없으면 null
        return (Objects.isNull(target))
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);
    }
}

