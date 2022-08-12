import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.inject.Inject;

import mapper.MemberMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
    private MemberMapper mapper;
    private static Logger logger = LoggerFactory.getLogger(Test.class);

    @Test
    public void testCreate() throws Exception {
        MemberVO vo = new MemberVO();
        Date now = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");

        vo.setNickname("aaa");
        vo.setName("aaa");
        vo.setId("aaa");
        vo.setPw("aaa");
        vo.setBirth(format.format(now));
        vo.setEmail("aaa");
        vo.setRank(1);
        vo.setAddress("aaa");
        vo.setPhonenum("1111111");
        vo.setCompanyNo("12312313");
        mapper.create(vo);
    }

    @Test
    public void testDelete() throws Exception{
        mapper.delete(1);
    }

    @Test
    public void testUpdate() throws Exception{
        MemberVO vo = new MemberVO();
        vo.setMemno(2);
        vo.setNickname("bbb");
        vo.setPw("bbb");
        vo.setPhonenum("222222");
        vo.setEmail("bbb");
        vo.setAddress("bbb");
        mapper.update(vo);
    }

    public static void main(String[] args) {


            Random random = new Random();
            StringBuffer sb = new StringBuffer();
            int num = 0;
            do {
                num = random.nextInt(75)+48;
                if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {

                    sb.append((char) num);
                } else {
                    continue;
                }
            } while (sb.length() <= 30);
            System.out.println(sb.toString());

    }

}

