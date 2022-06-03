package deu.manito.web.dto.article;


import deu.manito.web.entity.Article;
import deu.manito.web.entity.ChatMember;
import lombok.*;

import java.sql.Date;
import java.util.List;


@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDto {

    private Long id;
    private String title;
    private String nickname;
    private String content;
    private String image1;
    private String image2;
    private Date createTime;
    private Double lat;
    private Double lng;
    private String status;
    private String roomId;
    private String roomTitle;
    private int point;
    private List<ChatMember> chatMembers;

    // article 엔티티 클래스를 ArticleDto 클래스로 변환
    public static ArticleDto createArticleDto(Article article){
        return  ArticleDto.builder()
                .id(article.getId())
                .title(article.getTitle())
                .nickname(article.getNickname())
                .content(article.getContent())
                .image1(article.getImage1())
                .image2(article.getImage2())
                .createTime(article.getCreateTime())
                .lat(article.getLat())
                .lng(article.getLng())
                .status(article.getStatus())
                .roomId(article.getRoomId())
                .roomTitle(article.getRoomTitle())
                .point(article.getPoint())
                .chatMembers(article.getChatMembers())
                .build();
    }


}
