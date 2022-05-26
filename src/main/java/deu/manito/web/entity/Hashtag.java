package deu.manito.web.entity;


import lombok.*;

import javax.persistence.*;


@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Hashtag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long tagId;

    @Column
    private String tagName;
}
