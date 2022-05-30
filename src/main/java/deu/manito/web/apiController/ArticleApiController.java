package deu.manito.web.apiController;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.dto.chat.ChatDto;
import deu.manito.web.entity.Article;
import deu.manito.web.entity.Chat;
import deu.manito.web.service.ArticleService;
import deu.manito.web.service.ChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;


@Slf4j
@RestController
public class ArticleApiController {

    private ArticleService articleService;

    public ArticleApiController(ArticleService articleService){this.articleService = articleService;}


    @PostMapping("/api/articles/create")
    public ResponseEntity<ArticleDto> createBoard(@RequestBody ArticleDto articleDto){

        // 생성 날짜를 현재 시각으로 지정
        articleDto.setCreateTime(new Date(new java.util.Date().getTime()));

        ArticleDto result = articleService.createBoard(articleDto);

        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

//    @PatchMapping("/api/articles/{id}")
//    public ResponseEntity<Article> update(@PathVariable Long id, @RequestBody ArticleDto articleDto){
//
//        Article update = articleService.(id, articleDto);
//        log.info(articleDto.toString());
//
//        return (update != null) ?
//                ResponseEntupdateity.status(HttpStatus.OK).body(update) :
//                ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
//    }

}

