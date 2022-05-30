package deu.manito.web.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
* @package : deu.manito.web.controller
* @name : ArticleController.java
* @date : 2022-04-02 오후 4:16
* @author : Dong
**/
@Slf4j
@Controller
public class ArticleController {
    @GetMapping("/articles/create")
    public String createArticle(){ return "board/createArticle"; }

    // 게시판 구현 후 /article/{index} 로 수정해야함
    @GetMapping("/articles")
    public String article(){ return "board/viewArticle"; }
}
