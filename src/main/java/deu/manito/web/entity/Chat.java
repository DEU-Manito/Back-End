package deu.manito.web.entity;


import javax.persistence.*;
import java.sql.Date;

@Entity
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String title;
    
    @Column //위도
    private Double lat;
    
    @Column //경도
    private Double lng;

    @Column
    private Date createTime;
}
