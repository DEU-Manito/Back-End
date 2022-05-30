package deu.manito.web.dto.article;


import deu.manito.web.entity.Article;
import lombok.*;

import java.sql.Date;


@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArticleDto {

    private String title;
    private String nickname;
    private String content;
    private String image;
    private Date createTime;
    private Double lat;
    private Double lng;
    private String status;


    // article 엔티티 클래스를 ArticleDto 클래스로 변환
    public static ArticleDto createArticleDto(Article article){
        return  ArticleDto.builder()
                .title(article.getTitle())
                .nickname(article.getNickname())
                .content(article.getContent())
                .image(article.getImage())
                .createTime(article.getCreateTime())
                .lat(article.getLat())
                .lng(article.getLng())
                .status(article.getStatus())
                .build();
    }


}
