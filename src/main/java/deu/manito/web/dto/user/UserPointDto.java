package deu.manito.web.dto.user;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.entity.User;
import lombok.*;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
public class UserPointDto {
    private String nickname;
    private int point;

    public static UserPointDto createUserPointDto(ArticleDto articleDto){
        return UserPointDto.builder()
                .nickname(articleDto.getNickname())
                .point(articleDto.getPoint())
                .build();
    }

    public static UserPointDto createUserPointDto(String nickname, int point){
        return UserPointDto.builder()
                            .nickname(nickname)
                            .point(point)
                            .build();
    }
}




