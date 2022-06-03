package deu.manito.web.dto.chatMember;


import deu.manito.web.entity.ChatMember;
import lombok.*;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatMemberDto {
    private String nickname;
    private Long article_id;

    public static ChatMemberDto createChatMemberDto(ChatMember chatMember){
        return ChatMemberDto.builder()
                .nickname(chatMember.getNickname())
                .article_id(chatMember.getArticle_id())
                .build();
    }
}
