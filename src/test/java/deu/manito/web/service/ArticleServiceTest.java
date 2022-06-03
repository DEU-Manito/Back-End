package deu.manito.web.service;

import deu.manito.web.dto.article.ArticleDto;
import deu.manito.web.entity.Article;
import deu.manito.web.entity.Chat;
import deu.manito.web.entity.ChatMember;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest // 스프링 부트와 연동 되어 테스팅 됨
class ArticleServiceTest {

    @Autowired
    private ArticleService articleService;

    @Test
    void readArticle() {
        // 예상

        List<ChatMember> chatMembers = new ArrayList<>();

        chatMembers.add(ChatMember.builder().article_id(1L).nickname("dongdong0915_").build());
        chatMembers.add(ChatMember.builder().article_id(1L).nickname("rlawns0327").build());

        ArticleDto expected = ArticleDto.builder()
                                        .id(1L)
                                        .content("sad")
                                        .createTime(new Date(new java.util.Date("2022-05-30").getTime()))
                                        .image1("image1")
                                        .image2("image2")
                                        .lat(222.222)
                                        .lng(999.999)
                                        .nickname("admin")
                                        .point(1000)
                                        .roomId("testroomid")
                                        .roomTitle("testroomtitle")
                                        .status("active")
                                        .title("TestTitle")
                                        .chatMembers(chatMembers)
                                        .build();
        // 실제
        ArticleDto article = articleService.readArticle(1L);

        // 비교
        System.out.println(expected);
        System.out.println(article);

        assertEquals(expected.toString(), article.toString());

    }
}