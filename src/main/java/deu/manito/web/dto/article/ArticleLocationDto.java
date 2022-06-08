package deu.manito.web.dto.article;


import lombok.*;

@ToString
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArticleLocationDto {
    private Double lat;
    private Double lng;
}
