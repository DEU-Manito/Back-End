package deu.manito.web.controller;


import deu.manito.web.dto.chat.ChatDto;
import deu.manito.web.service.ChatService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ChatController {

    private ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping("/chat")
    public String chat(Model model){
        // 생성 되어있는 채팅방을 가져옴
        List<ChatDto> chatlist = chatService.getChatList();

        model.addAttribute("chatlist", chatlist);
        
        return "chat/chat";
    }
}
