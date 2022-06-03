package deu.manito.web.entity;


import deu.manito.web.dto.chatMember.ChatMemberDto;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ChatMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column private String nickname;
    @Column private Long article_id;

    public static ChatMember toEntity(ChatMemberDto dto){
        return ChatMember.builder()
                .nickname(dto.getNickname())
                .article_id(dto.getArticle_id())
                .build();
    }
}
