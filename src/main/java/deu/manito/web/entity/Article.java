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
}
