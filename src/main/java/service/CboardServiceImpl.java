package service;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import domain.CboardVO;
import domain.CbCriteria;
import mapper.CboardMapper;

@Service
//@Configuration
@MapperScan("mapper")
public class CboardServiceImpl implements CboardService {
    @Autowired
    private CboardMapper cboardMapper;


    @Override
    @Transactional
    public List<CboardVO> listCboard(CbCriteria cri) throws Exception {
        return cboardMapper.listCboard(cri);
    }

    @Override
    public int listCount() throws Exception {
        return cboardMapper.listCount();
    }

    @Override
    public void writeCboard(CboardVO cboard) throws Exception {
        cboardMapper.writeCboard(cboard);

    }

    @Override
    public CboardVO readCboard(Integer cbno) throws Exception {
        return cboardMapper.readCboard(cbno);
    }

    @Override
    public void modifyCboard(CboardVO cboard) throws Exception {
        cboardMapper.modifyCboard(cboard);
    }


    @Override
    public void deleteCboard(int cbno) throws Exception {
        cboardMapper.deleteCboard(cbno);
    }





}
