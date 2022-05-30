package deu.manito.web.entity;


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
}
