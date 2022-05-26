package deu.manito.web.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ArticleTag implements Serializable {
    @Id
    private Long articleId;

    @Id
    private Long hashtagId;
}
