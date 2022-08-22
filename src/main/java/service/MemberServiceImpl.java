package service;

import domain.MemberVO;
import domain.LoginDTO;
import lombok.Setter;
import mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class MemberServiceImpl implements MemberService {

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Override
    public MemberVO login(LoginDTO dto) throws Exception {
        return mapper.login(dto);
    }

}
