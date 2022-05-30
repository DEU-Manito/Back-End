package deu.manito.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import deu.manito.web.entity.Article;

public interface ArticleRepository extends JpaRepository<Article, Long>{

}

