package deu.manito.web.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


/**
* @package : deu.manito.web.controller
* @name : IndexController.java
* @date : 2022-04-02 오후 4:02
* @author : Dong
**/

@Slf4j
@Controller // 기본 페이지 이동은 IndexController 에서 처리
public class IndexController {

    @GetMapping("/")
    public String index() { return "index"; }


    @GetMapping("/chat")
    public String chat(Model model){ return "chat/chat"; }

    @GetMapping("/board")
    public String board(){ return "board/board";}

    @GetMapping("/locationAuth")
    public String locationAuth(){ return "location/locationAuth"; }
}
