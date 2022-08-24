package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import domain.Criteria;
import domain.ReplyVO;
import mapper.ReplyBoardMapper;

@Service
@MapperScan("mapper")
public class ReplyServiceImpl implements ReplyService {
  @Autowired
  private ReplyBoardMapper replyBoardMapper;

  @Override
  public void addReply(ReplyVO vo) throws Exception {

    replyBoardMapper.create(vo);
  }

  @Override
  public List<ReplyVO> listReply(Integer bno) throws Exception {

    return replyBoardMapper.list(bno);
  }

  @Override
  public void modifyReply(ReplyVO vo) throws Exception {

    replyBoardMapper.update(vo);
  }

  @Override
  public void deleteReply(Integer rno) throws Exception {

    replyBoardMapper.delete(rno);
  }

  @Override
  public List<ReplyVO> listReplyPage(Integer boardNo, Criteria cri)
      throws Exception {
    Map<String, Object> paramMap = new HashMap<String, Object>();
    paramMap.put("boardNo", boardNo);
    paramMap.put("cri", cri);
    return replyBoardMapper.listPage(paramMap);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return replyBoardMapper.count(bno);
  }

}
