package deu.manito.web.repository;

import deu.manito.web.entity.ChatMember;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatMemberRepository extends JpaRepository<ChatMember, String> {
}
