package mapper;

import domain.Criteria;
import domain.ReplyVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ReplyBoardMapper {

    public List<ReplyVO> list(Integer boardNo) throws Exception;

    public void create(ReplyVO vo) throws Exception;

    public void update(ReplyVO vo) throws Exception;

    public void delete(Integer replyNo) throws Exception;

    public List<ReplyVO> listPage(Map<String, Object> paramMap) throws Exception;

    public int count(Integer boardNo) throws Exception;
}
