package mapper;

import domain.Criteria;
import domain.ReplyVO;

import java.util.List;

public interface ReplyBoardMapper {

    public List<ReplyVO> list(Integer bno) throws Exception;

    public void create(ReplyVO vo) throws Exception;

    public void update(ReplyVO vo) throws Exception;

    public void delete(Integer rno) throws Exception;

    public List<ReplyVO> listPage(
            Integer bno, Criteria cri) throws Exception;

    public int count(Integer bno) throws Exception;
}
