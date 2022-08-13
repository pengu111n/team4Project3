package service;

import java.util.List;

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
  public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception {

    return replyBoardMapper.listPage(bno, cri);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return replyBoardMapper.count(bno);
  }

}
