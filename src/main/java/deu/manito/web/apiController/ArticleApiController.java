package deu.manito.web.apiController;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.dto.article.ArticleLocationDto;
import deu.manito.web.dto.user.UserDto;
import deu.manito.web.entity.User;
import deu.manito.web.service.ArticleService;
import deu.manito.web.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
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
    @ApiOperation(value = "게시글 생성", notes = "게시글을 생성합니다.")
    public ResponseEntity<ArticleDto> createArticle(@RequestBody ArticleDto articleDto, HttpServletRequest request){

        // 생성 날짜를 현재 시각으로 지정
        articleDto.setCreateTime(new Date(new java.util.Date().getTime()));

        // 생성
        ArticleDto target = articleService.createArticle(articleDto);

        UserDto user = userService.getProfile(articleDto.getNickname());

        // 유저 세션 갱신 (포인트 갱신)
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        return Objects.isNull(target)
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);
    }

    // 게시글 조회
    @GetMapping("/api/articles/{articleId}")
    @ApiOperation(value = "게시글 조회", notes = "게시글을 조회합니다.")
    public ResponseEntity<ArticleDto> readArticle(@PathVariable Long articleId){

        ArticleDto target = articleService.readArticle(articleId);

        return (Objects.isNull(target))
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);

    }


    // 게시글 수정
    @PatchMapping("/api/articles/{articleId}")
    @ApiOperation(value = "게시글 수정", notes = "게시글을 수정합니다.")
    public ResponseEntity<ArticleDto> updateArticle(@PathVariable Long articleId, @RequestBody ArticleDto articleDto, HttpServletRequest request){
        if(articleDto.getPoint() < 0) return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();

        articleDto.setCreateTime(new Date(new java.util.Date().getTime()));

        // 포인트 수정도 같이 필요
        ArticleDto target = articleService.updateArticle(articleId, articleDto);

        UserDto user = userService.getProfile(articleDto.getNickname());

        // 유저 세션 갱신 (포인트 갱신)
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        return (Objects.isNull(target))
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);
    }

    // 게시글 삭제
    @DeleteMapping("/api/articles/{articleId}")
    @ApiOperation(value = "게시글 삭제", notes = "게시글을 삭제합니다.")
    public ResponseEntity<ArticleDto> deleteArticle(@PathVariable Long articleId, HttpServletRequest request){

        ArticleDto target = articleService.deleteArticle(articleId);

        UserDto user = userService.getProfile(target.getNickname());

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // 삭제되면 entity 반환 / 삭제할 게시글 없으면 null
        return (Objects.isNull(target))
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(target);
    }

    // 모든 게시글 조회
    @PostMapping("/api/articles/markers")
    @ApiOperation(value = "전체 게시글 조회", notes = "등록된 모든 게시글을 조회합니다.")
    public ResponseEntity<List<ArticleDto>> getAllArticles(@RequestBody ArticleLocationDto dto) {
        List<ArticleDto> articleList = articleService.getNearByArticles(dto);

        return Objects.isNull(articleList)
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(articleList);
    }
}

