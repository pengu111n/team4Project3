package service;

import domain.MemberVO;
import domain.LoginVO;
import lombok.Setter;
import mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Override
    public MemberVO login(LoginVO vo) throws Exception {

        return mapper.login(vo);

    }

}
