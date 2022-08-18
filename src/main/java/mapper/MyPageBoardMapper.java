package mapper;

import domain.BoardVO;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MyPageBoardMapper {

    public List<BoardVO> getList(int memNO);

}
