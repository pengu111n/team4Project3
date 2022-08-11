package service;

import domain.MemberVO;
import junit.framework.TestCase;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyPageMemberServiceTest extends TestCase {

    @Setter(onMethod_ = @Autowired)
    private MyPageMemberService service;

    @Test
    public void testExist() {

        log.info(service);
        assertNotNull(service);

    }

    @Test
    public void testGet() {

        log.info(service.get(1L));

    }

    @Test
    public void testModify() {

        MemberVO member = service.get(1L);

        if (member == null) {
            return;
        }

        member.setNickname("닉네임 수정");
        log.info("modify result: " + service.modify(member));

    }

    @Test
    public void testRemove() {

        log.info("remove result: " + service.remove(2L));

    }
}