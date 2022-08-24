package mapper;

import domain.BoardVO;

import java.util.List;

public interface MyPageBoardMapper {

    public List<BoardVO> getList(int memNO);

}
