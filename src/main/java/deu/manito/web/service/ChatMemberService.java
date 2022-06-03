package deu.manito.web.service;

import deu.manito.web.dto.chatMember.ChatMemberDto;
import deu.manito.web.entity.Chat;
import deu.manito.web.entity.ChatMember;
import deu.manito.web.repository.ChatMemberRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class ChatMemberService {

    private final ChatMemberRepository chatMemberRepository;

    public ChatMemberService(ChatMemberRepository chatMemberRepository) {
        this.chatMemberRepository = chatMemberRepository;
    }

    @Transactional
    public ChatMemberDto addMember(ChatMemberDto chatMemberDto){
        ChatMember chatMember = ChatMember.toEntity(chatMemberDto);

        ChatMember result = chatMemberRepository
                                        .findMember(chatMemberDto.getNickname(), chatMemberDto.getArticle_id())
                                        .orElse(null);

        // 채팅 멤버에 등록되지 않은 경우에만 save
        if(Objects.isNull(result)) result = chatMemberRepository.save(chatMember);

        return ChatMemberDto.createChatMemberDto(result);
    }

    public List<ChatMemberDto> getMembers(Long articleId){
        List<ChatMemberDto> chatMembers = chatMemberRepository.findByArticleId(articleId)
                                                            .stream().map(chatMember -> ChatMemberDto.createChatMemberDto(chatMember))
                                                            .collect(Collectors.toList());

        return chatMembers;
    }
}
