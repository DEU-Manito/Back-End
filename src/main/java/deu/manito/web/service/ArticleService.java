package deu.manito.web.service;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.entity.Article;
import deu.manito.web.repository.ArticleRepository;
import org.springframework.stereotype.Service;

@Service
public class ArticleService {

    private ArticleRepository articleRepository;

    public ArticleService(ArticleRepository articleRepository) {this.articleRepository = articleRepository; }

    // 게시글 작성
    public ArticleDto createBoard(ArticleDto articleDto){

        Article article = articleRepository.save(Article.toEntity(articleDto));

        return ArticleDto.createArticleDto(article);
    }

}

