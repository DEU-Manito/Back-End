package deu.manito.web.controller;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
* @package : deu.manito.web.controller
* @name : ArticleController.java
* @date : 2022-04-02 오후 4:16
* @author : Dong
**/
@Slf4j
@Controller
public class ArticleController {

    private ArticleService articleService;

    public ArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }

    @GetMapping("/articles")
    public String articleBoard(Model model){
        List<ArticleDto> articles = articleService.getAllArticles();

        model.addAttribute("articles", articles);
        return "board/board";
    }

    @GetMapping("/articles/create")
    public String createArticle(){ return "board/createArticle"; }

    // 게시판 구현 후 /article/{index} 로 수정해야함
    @GetMapping("/articles/{articleId}")
    public String article(@PathVariable Long articleId, Model model){
        ArticleDto article = articleService.readArticle(articleId);

        model.addAttribute("article", article);

        return "board/viewArticle";
    }
}
