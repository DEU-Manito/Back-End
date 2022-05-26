package deu.manito.web.apiController;


import deu.manito.web.dto.chat.ChatCreateDto;
import deu.manito.web.service.ChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@Slf4j
@RestController
public class ChatApiController {
    private final ChatService chatService;

    public ChatApiController(ChatService chatService) {
        this.chatService = chatService;
    }

    @PostMapping("/api/chat/create")
    public ResponseEntity<ChatCreateDto> createChatting(@RequestBody ChatCreateDto chatCreateDto){
        return null;
    }
}

