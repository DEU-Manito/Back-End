package deu.manito.web.service;


import deu.manito.web.dto.chat.ChatDto;
import deu.manito.web.dto.chat.ChatLocationDto;
import deu.manito.web.entity.Chat;
import deu.manito.web.repository.ChatRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
* @package : deu.manito.web.service
* @name : ChatService.java
* @date : 2022-05-27 오후 9:05
* @author : Dong
**/
@Slf4j
@Service
public class ChatService {
    private ChatRepository chatRepository;

    public ChatService(ChatRepository chatRepository) {
        this.chatRepository = chatRepository;
    }
    
    
    // 채팅방 생성 메소드
    @Transactional
    public ChatDto createChat(ChatDto chatDto){
        Chat chat = Chat.toEntity(chatDto);

        Chat created = chatRepository.save(chat);

        if(Objects.isNull(created)) throw new IllegalArgumentException("채팅방 생성 오류");

        return ChatDto.createChatDto(created);
    }

    // DB에 저장되어 있는 채팅방을 가져오는 메소드
    public List<ChatDto> getChatList(ChatLocationDto locationDto){
        return chatRepository.findAllNearByChat(locationDto.getLat(), locationDto.getLng())
                .stream().map(chat -> ChatDto.createChatDto(chat))
                .collect(Collectors.toList());
    }
}
