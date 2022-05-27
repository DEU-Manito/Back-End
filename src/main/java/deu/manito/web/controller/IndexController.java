package deu.manito.web.controller;


import deu.manito.web.apiController.ChatApiController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class indexController {

    @GetMapping("/")
    public String index() { return "index"; }
}
