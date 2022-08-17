package mapper;

import domain.MemberVO;
import org.apache.ibatis.annotations.Param;


public interface MemberMapper {
	public void create(MemberVO vo) throws Exception;

	public void update(MemberVO vo) throws Exception;

	public void delete(Integer memno) throws Exception;

	public void login(MemberVO vo) throws  Exception;

	public int idCheck(String id) throws Exception;

	public void createAuth(String email, String authKey) throws Exception;
	public void memberAuth(String email, String authKey) throws Exception;

	public void attachImg(String fileName, Integer memNo)throws Exception;

}
