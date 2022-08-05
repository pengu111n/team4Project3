import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import domain.MemberVO;
import service.MemberServiceImpl;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class test {
    @Inject
    private MemberServiceImpl dao;
    private static Logger logger = LoggerFactory.getLogger(Test.class);

    @Test
    public void testCreate() throws Exception {
        MemberVO vo = new MemberVO();
        vo.setId("aaa");
        vo.setPw("aaa");
        vo.setBirth(new Date());
        vo.setEmail("aaa");
        vo.setRank(1);
        vo.setAddress("aaa");
        vo.setPhonenum("1111111");
        vo.setCompanyNo("12312313");
        dao.create(vo);
    }
}