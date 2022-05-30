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

<<<<<<< HEAD
    @Column private String nickname;
    @Column private String title;
    @Column private String content;
    @Column private Date   createTime;
    @Column private Double lat; //위도
    @Column private Double lng; //경도
    @Column private String status;
    @Column private String roomId;
    @Column private String roomTitle;
    @Column private int    point;
    @Column(columnDefinition = "TEXT") private String image1;
    @Column(columnDefinition = "TEXT") private String image2;
=======
    @Column
    private String  title;

    @Column
    private String nickname;

    @Column
    private String content;

    @Column(columnDefinition = "TEXT")
    private String image;

    @Column
    private Date createTime;

    @Column //위도
    private Double lat;

    @Column //경도
    private Double lng;

    @Column
    private String status;

    public static Article toEntity(ArticleDto articleDto){
        return Article.builder()
                .title(articleDto.getTitle())
                .nickname(articleDto.getNickname())
                .content(articleDto.getContent())
                .image(articleDto.getImage())
                .createTime(articleDto.getCreateTime())
                .lat(articleDto.getLat())
                .lng(articleDto.getLng())
                .status(articleDto.getStatus())
                .build();
    }

>>>>>>> 53b4a4e ( ADD : 게시글 작성 기능 구현)
}
