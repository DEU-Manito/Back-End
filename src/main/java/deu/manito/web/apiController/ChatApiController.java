package deu.manito.web.apiController;


import deu.manito.web.dto.chat.ChatDto;
import deu.manito.web.dto.chat.ChatLocationDto;
import deu.manito.web.entity.Chat;
import deu.manito.web.service.ChatService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Date;
import java.util.List;

/**
* @package : deu.manito.web.apiController
* @name : ChatApiController.java
* @date : 2022-05-28 오후 4:01
* @author : Dong
**/

@Slf4j
@RestController
public class ChatApiController {
    private final ChatService chatService;

    public ChatApiController(ChatService chatService) {
        this.chatService = chatService;
    }

    @PostMapping("/api/chat/create") // 채팅방 생성
    @ApiOperation(value = "채팅방 생성", notes = "사용자의 위치에서 채팅방을 생성합니다.")
    public ResponseEntity<ChatDto> createChatting(@RequestBody ChatDto chatDto){

        log.info(chatDto.toString());
        // 생성 날짜를 현재 시각으로 지정
        chatDto.setCreateTime(new Date(new java.util.Date().getTime()));

        ChatDto result = chatService.createChat(chatDto);

        return ResponseEntity.status(HttpStatus.OK).body(result);
    }

    
    @PostMapping("/api/chat/markers")  // 사용자의 위치를 받아와 주변 반경 500m 이내의 채팅방 리스트를 반환
    @ApiOperation(value = "채팅 목록 조회", notes = "사용자 주변 반경 500m 이내의 채팅방을 조회합니다.")
    public ResponseEntity<List<ChatDto>> getChattingList(@RequestBody ChatLocationDto locationDto){
        log.info(locationDto.toString());
        List<ChatDto> chatlist = chatService.getChatList(locationDto);

        return ResponseEntity.status(HttpStatus.OK).body(chatlist);
    }
}

