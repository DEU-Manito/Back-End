package deu.manito.web.service;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.dto.article.ArticleLocationDto;
import deu.manito.web.dto.user.UserPointDto;
import deu.manito.web.entity.Article;
import deu.manito.web.entity.User;
import deu.manito.web.repository.ArticleRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Slf4j
@Service
public class ArticleService {

    private ArticleRepository articleRepository;
    private UserService userService;

    public ArticleService(ArticleRepository articleRepository, UserService userService) {
        this.articleRepository = articleRepository;
        this.userService = userService;
    }

    // 게시글 작성
    @Transactional
    public ArticleDto createArticle(ArticleDto articleDto){

        // 금액 처리위한 UserPointDto 생성
        UserPointDto userPointDto = UserPointDto.createUserPointDto(articleDto);
        
        // 포인트가 음수로 들어온 경우 바로 리턴
        if(articleDto.getPoint() < 0) return null;
        
        userService.withdrawPoint(userPointDto);

        Article target = articleRepository.save(Article.toEntity(articleDto));

        return Objects.isNull(target)
                ? null
                : ArticleDto.createArticleDto(target);
    }


    public ArticleDto readArticle(Long articleId){

        // 2. 대상 Entity 찾기
        Article target = articleRepository.findById(articleId)
                                          .orElseThrow(() -> new IllegalArgumentException("게시글 조회 오류"));

        return ArticleDto.createArticleDto(target);
    }


    @Transactional
    public ArticleDto updateArticle(Long articleId, ArticleDto articleDto){
        log.info(articleDto.toString());

        // 수정할 게시글 찾기
        Article target = articleRepository.findById(articleId)
                                          .orElseThrow(() -> new IllegalArgumentException("게시글 수정 오류"));

        int prePoint = target.getPoint();
        int curPoint = articleDto.getPoint();
        UserPointDto userPointDto = UserPointDto.createUserPointDto(articleDto.getNickname(), Math.abs(prePoint - curPoint));

        if(prePoint < curPoint) userService.withdrawPoint(userPointDto);    // 포인트를 올린 경우 ( 이전 포인트보다 현재 포인트가 큰 경우 )
        else userService.depositPoint(userPointDto);                        // 포인트를 내린 경우

        target.patch(articleDto);

        return ArticleDto.createArticleDto(target);
    }


    @Transactional
    public ArticleDto deleteArticle(Long articleId) {

        Article target = articleRepository.findById(articleId)
                                          .orElseThrow(()-> new IllegalArgumentException("게시글 삭제 오류"));
        
        // 완료 되지 않은 상태에서 삭제하면 포인트를 반환해줌
        if("active".equals(target.getStatus())) userService.depositPoint(UserPointDto.createUserPointDto(target.getNickname(), target.getPoint()));

        articleRepository.deleteById(target.getId());

        return ArticleDto.createArticleDto(target);
    }

    public List<ArticleDto> getAllArticles(){
        List<ArticleDto> articles = articleRepository.findAll()
                .stream().map(article -> ArticleDto.createArticleDto(article))
                .collect(Collectors.toList());

        return articles;
    }

    public List<ArticleDto> getNearByArticles(ArticleLocationDto dto){
        List<ArticleDto> articles = articleRepository.findAllNearByArticle(dto.getLat(), dto.getLng())
                                        .stream().map(article -> ArticleDto.createArticleDto(article))
                                        .collect(Collectors.toList());

        return articles;
    }
}

