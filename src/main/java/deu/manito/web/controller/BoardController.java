package deu.manito.web.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class BoardController {

    @GetMapping("/board")
    public String board(){ return "board/board";}
}
