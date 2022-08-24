package service;

import domain.CbSearchCriteria;
import domain.CboardVO;

import java.util.List;

public interface CboardService {

    public void writeCboard(CboardVO cboard) throws Exception;

    public CboardVO readCboard(Integer cbno) throws Exception;

    public List<CboardVO> listCboard(CbSearchCriteria scri) throws Exception;

    public int listCount(CbSearchCriteria scri) throws Exception;

    public void modifyCboard(CboardVO cboard) throws Exception;

    public void deleteCboard(int cbno) throws Exception;

    public void addAttach(String fullName)throws Exception;

    public List<String> getAttach(Integer cbno)throws Exception;

    public void deleteAttach(Integer cbno)throws Exception;

    public void replaceAttach(String fullName, Integer cbno)throws Exception;

}
