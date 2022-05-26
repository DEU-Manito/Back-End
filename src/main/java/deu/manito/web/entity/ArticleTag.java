package deu.manito.web.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class ArticleTag implements Serializable {
    @Id
    private Long articleId;

    @Id
    private Long hashtagId;
}
