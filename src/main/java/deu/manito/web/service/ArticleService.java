package deu.manito.web.service;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.entity.Article;
import deu.manito.web.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@Service
public class ArticleService {

    private ArticleRepository articleRepository;

    public ArticleService(ArticleRepository articleRepository) {this.articleRepository = articleRepository; }

    // 게시글 작성
    public ArticleDto createArticle(ArticleDto articleDto){

        Article target = articleRepository.save(Article.toEntity(articleDto));

        //금액 차감




        return ArticleDto.createArticleDto(target);
    }


    public ArticleDto readArticle(ArticleDto articleDto){

        // 2. 대상 Entity 찾기
        Article target = articleRepository.findById(articleDto.getId()).orElse(null);

        // 3. 잘못된 처리
        if(Objects.isNull(target)){
            return null;
        }

        return ArticleDto.createArticleDto(target);
    }


    @Transactional
    public ArticleDto updateArticle(ArticleDto articleDto){

        // 2. 대상 Entity 찾기
        Article target = articleRepository.findById(articleDto.getId()).orElse(null);

        // 3. 잘못된 처리
        if(Objects.isNull(target)){
            return null;
        }

        target.patch(articleDto);

        return ArticleDto.createArticleDto(target);
    }


    public ArticleDto deleteArticle(ArticleDto articleDto) {

        Article target = articleRepository.findById(articleDto.getId()).orElse(null);

        // 3. 잘못된 처리
        if(Objects.isNull(target)){
            return null;
        }

        articleRepository.deleteById(target.getId());

        return ArticleDto.createArticleDto(target);
    }





}

