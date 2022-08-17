package mapper;

import domain.Criteria;
import domain.ReplyVO;

import java.util.List;

public interface ReplyBoardMapper {

    public List<ReplyVO> list(Integer boardNo) throws Exception;

    public void create(ReplyVO vo) throws Exception;

    public void update(ReplyVO vo) throws Exception;

    public void delete(Integer replyNo) throws Exception;

    public List<ReplyVO> listPage(
            Integer boardNo, Criteria cri) throws Exception;

    public int count(Integer boardNo) throws Exception;
}
