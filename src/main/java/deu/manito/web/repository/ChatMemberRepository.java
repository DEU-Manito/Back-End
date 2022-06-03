package deu.manito.web.repository;

import deu.manito.web.entity.ChatMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ChatMemberRepository extends JpaRepository<ChatMember, Long> {

    @Query(value = "SELECT * FROM chat_member WHERE nickname = :nickname AND article_id = :article_id", nativeQuery = true)
    Optional<ChatMember> findMember(@Param("nickname") String nickname, @Param("article_id") Long article_id);

    @Query(value = "SELECT * FROM chat_member WHERE article_id = :article_id", nativeQuery = true)
    List<ChatMember> findByArticleId(@Param("article_id") Long article_id);
}
