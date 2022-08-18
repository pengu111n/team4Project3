package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        List<CboardVO> list = cboardMapper.listCboard(cri);
        for(CboardVO vo : list) {
            Integer cbno = vo.getCbno();
            List<String> filesList = cboardMapper.getAttach(cbno);
            String[] files = new String[filesList.size()];
            filesList.toArray(files);
            vo.setFiles(files);
        }
        return list;
    }

    @Override
    public int listCount() throws Exception {
        return cboardMapper.listCount();
    }

    @Transactional
    @Override
    public void writeCboard(CboardVO cboard) throws Exception {
        cboardMapper.writeCboard(cboard);

        String[] files = cboard.getFiles();

        if(files == null) { return; }

        for (String fileName : files) {
            cboardMapper.addAttach(fileName);
        }

    }

    @Override
    public CboardVO readCboard(Integer cbno) throws Exception {
        return cboardMapper.readCboard(cbno);
    }

    @Transactional
    @Override
    public void modifyCboard(CboardVO cboard) throws Exception {
        cboardMapper.modifyCboard(cboard);

        Integer cbno = cboard.getCbno();

        cboardMapper.deleteAttach(cbno);

        String[] files = cboard.getFiles();

        if(files == null) { return; }

        for(String fileName : files) {
            cboardMapper.replaceAttach(fileName, cbno);
        }
    }

    @Override
    public void deleteCboard(int cbno) throws Exception {
        cboardMapper.deleteCboard(cbno);
    }

    //파일첨부
    @Override
    public void addAttach(String fullName) throws Exception {
        cboardMapper.addAttach(fullName);

    }

    @Override
    public List<String> getAttach(Integer cbno) throws Exception {
        return cboardMapper.getAttach(cbno);
    }


    @Override
    public void deleteAttach(Integer cbno) throws Exception {
        cboardMapper.deleteAttach(cbno);

    }


    @Override
    public void replaceAttach(String fullName, Integer cbno) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("cbno", cbno);
        paramMap.put("fullName", fullName);

        cboardMapper.replaceAttach(paramMap);

    }




}
