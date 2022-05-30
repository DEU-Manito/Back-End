package deu.manito.web.service;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.entity.Article;
import deu.manito.web.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    public ArticleService(ArticleRepository articleRepository) {this.articleRepository = articleRepository; }

    // 게시글 작성
    public ArticleDto createBoard(ArticleDto articleDto){

        Article article = articleRepository.save(Article.toEntity(articleDto));

        return ArticleDto.createArticleDto(article);
    }

    public Article update(Long id, ArticleDto articleDto){

        // 1. 수정용 Entity 생성
        Article article = Article.toEntity(articleDto);

        // 2. 대상 Entity 찾기
        Article target = articleRepository.findById(id).orElse(null);

        // 3. 잘못된 처리
        if(target == null || id != articleDto.getId()){
            return null;
        }

        target.patch(article);
        Article update = articleRepository.save(target);

        return update;
    }

}

