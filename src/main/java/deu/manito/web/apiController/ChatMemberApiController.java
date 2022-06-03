package deu.manito.web.apiController;


import deu.manito.web.dto.chatMember.ChatMemberDto;
import deu.manito.web.entity.ChatMember;
import deu.manito.web.service.ChatMemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
public class ChatMemberApiController {

    private final ChatMemberService chatMemberService;

    public ChatMemberApiController(ChatMemberService chatMemberService) {
        this.chatMemberService = chatMemberService;
    }

    @PostMapping("/api/chatMember")
    public ResponseEntity<ChatMemberDto> addChatMember(@RequestBody ChatMemberDto dto){
        ChatMemberDto result = chatMemberService.addMember(dto);

        return Objects.isNull(result)
                ? ResponseEntity.status(HttpStatus.BAD_REQUEST).build()
                : ResponseEntity.status(HttpStatus.OK).body(result);
    }

    @GetMapping("/api/chatMember/{articleId}")
    public ResponseEntity<List<ChatMemberDto>> getChatMembers(@PathVariable Long articleId){
        List<ChatMemberDto> chatMembers = chatMemberService.getMembers(articleId);

        return ResponseEntity.status(HttpStatus.OK).body(chatMembers);
    }
}
