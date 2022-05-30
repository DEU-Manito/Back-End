package deu.manito.web.controller;


import deu.manito.web.service.ChatService;
import org.springframework.stereotype.Controller;

/**
* @package : deu.manito.web.controller
* @name : ChatController.java
* @date : 2022-04-02 오후 4:15
* @author : Dong
**/

@Controller
public class ChatController {

    private ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

}
