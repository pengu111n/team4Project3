package service;

import domain.MemberVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import mapper.MyPageMemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j
@Service
public class MyPageMemberServiceImpl implements MyPageMemberService {

    @Setter(onMethod_ = @Autowired)
    private MyPageMemberMapper mapper;

    @Override
    public MemberVO get(Long memno) {

        log.info("get......" + memno);

        return mapper.read(memno);

    }

    @Override
    public boolean modify(MemberVO member) {

        log.info("modify......" + member);

        return mapper.update(member) == 1;

    }

    @Override
    public boolean remove(Long memno) {

        log.info("remove......" + memno);

        return mapper.delete(memno) == 1;

    }

}
