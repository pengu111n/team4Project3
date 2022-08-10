package mapper;

import domain.BoardVO;
import domain.MemberVO;

import java.util.List;

public interface MemberMapper {
	List<MemberVO> selectBoardList() throws Exception;
}
