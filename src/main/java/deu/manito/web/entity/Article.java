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

<<<<<<< HEAD
=======
    @Column
    private int point;

    // 게시글 생성
>>>>>>> 495a103 ( MODIFY : 게시글 point 칼럼 추가작업)
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
                .point(articleDto.getPoint())
                .build();
    }

<<<<<<< HEAD
>>>>>>> 53b4a4e ( ADD : 게시글 작성 기능 구현)
=======
    // 게시글 수정
    public void patch(Article article){
        if(article.title != null)
            this.title = article.title;
        if(article.content != null)
            this.content = article.content;
        if(article.image != null)
            this.image = article.image;
        if(article.createTime != null)
            this.createTime = article.createTime;
        if(article.lat != null)
            this.lat = article.lat;
        if(article.lng != null)
            this.lng = article.lng;
        if(article.point != 0)
            this.point = article.point;
    }

>>>>>>> 495a103 ( MODIFY : 게시글 point 칼럼 추가작업)
}
