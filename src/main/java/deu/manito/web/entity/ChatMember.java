package deu.manito.web.entity;


import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class ChatMember {
    @Id
    private String nickname;

    @Column
    private Long article_id;
}
