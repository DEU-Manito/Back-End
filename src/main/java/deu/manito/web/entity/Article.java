package deu.manito.web.entity;


import deu.manito.web.dto.article.ArticleDto;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;

@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String nickname;
    @Column
    private String title;
    @Column
    private String content;
    @Column
    private Date createTime;
    @Column
    private Double lat; //위도
    @Column
    private Double lng; //경도
    @Column
    private String status;
    @Column
    private String roomId;
    @Column
    private String roomTitle;
    @Column
    private int point;
    @Column(columnDefinition = "TEXT")
    private String image1;
    @Column(columnDefinition = "TEXT")
    private String image2;

    public static Article toEntity(ArticleDto articleDto) {
        return Article.builder()
                .id(articleDto.getId())
                .title(articleDto.getTitle())
                .nickname(articleDto.getNickname())
                .content(articleDto.getContent())
                .image1(articleDto.getImage1())
                .image2(articleDto.getImage2())
                .createTime(articleDto.getCreateTime())
                .lat(articleDto.getLat())
                .lng(articleDto.getLng())
                .status(articleDto.getStatus())
                .point(articleDto.getPoint())
                .roomId(articleDto.getRoomId())
                .roomTitle(articleDto.getRoomTitle())
                .build();
    }

    // 게시글 수정
    public void patch(ArticleDto articleDto) {
        if (articleDto.getTitle() != null)
            this.title = articleDto.getTitle();
        if (articleDto.getContent() != null)
            this.content = articleDto.getContent();
        if(articleDto.getCreateTime() != null)
            this.createTime = articleDto.getCreateTime();
    }
}