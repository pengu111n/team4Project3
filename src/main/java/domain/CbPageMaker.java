package domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;


//페이징 처리에 필요한 모든 데이터를 담는다
public class CbPageMaker {

    private int totalCount; //전체 데이터의 개수 //2
    private int startPage;  //시작 페이지 번호   //1
    private int endPage;    //끝 페이지 번호     //10 -> 1
    private boolean prev;   //이전 페이지 링크   //false
    private boolean next;   //이후 페이지 링크   //false
    private int displayPageNum = 5;
    private CbCriteria cri; //페이지 정보 객체


    public void setCri(CbCriteria cri) {
        this.cri = cri;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        calcData();
    }

    private void calcData() {

        //endPage는 현재의 페이지 번호를 기준으로 계산한다.
        //cri.getPage()는 현재 페이지의 번호를 의미하며 아래와 계산할 수 있다.
        //현재 페이지가 3일 때, Math.ceil(3/10)*10=10    1-10(1페이지)
        //              20일 때, Math.ceil(20/10)*10=20  11-20(2페이지)
        //              21일 때, Math.ceil(21/10)*10=30  21-30(3페이지)
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

        //endPage가 구해졌다면 startPage는 단순한 빼기의 문제이다.
        //startPage = (endPage – 10) + 1;
        startPage = (endPage - displayPageNum) + 1;

        //예를 들어 100개의 데이터(totalCount)를 10개씩 보여준다면(perPageNum)
        //endPage는 10이 되어야 하지만, 20개씩 보여주는 경우에는 endPage는 5가 되어야 한다.
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        //pre의 경우는 startPage가 1이 아닌지를 검사하는 것으로 충분하다.
        prev = startPage == 1 ? false : true;

        //next의 경우는 뒤에 더 데이터가 남아 있는지에 대한 처리하므로
        //endPage * perPageNum이 totalCount보다 작은지를 확인해 줘야 한다.
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public boolean isNext() {
        return next;
    }

    public int getDisplayPageNum() {
        return displayPageNum;
    }

    public CbCriteria getCri() {
        return cri;
    }

    public String makeQuery(int page){
        // 원하는 페이지로 페이지 쿼리문을 넘긴다.
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page) // page번호를 파라미터값으로 넘김
                        .queryParam("perPageNum", cri.getPerPageNum()) // page당 게시글 갯수를 파라미터값으로 넘김
                        .build();

        return uriComponents.toUriString();
    }

    //PageMaker에서 적당한 URI에 사용할 문자열(query string)을 생성해 준다.
    public String makeSearch(int page){

        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", cri.getPerPageNum())
                        .queryParam("searchType", ((CbSearchCriteria)cri).getSearchType())
                        .queryParam("keyword", ((CbSearchCriteria)cri).getKeyword())
                        .build();

        return uriComponents.toUriString();
    }

    private String encoding(String keyword) {
        if(keyword == null || keyword.trim().length() == 0) {
            return "";
        }

        try {
            return URLEncoder.encode(keyword, "UTF-8");
        } catch(UnsupportedEncodingException e) {
            return "";
        }
    }
    @Override
    public String toString() {
        return "PageMaker [totalCount=" + totalCount + ", startPage="
                + startPage + ", endPage=" + endPage + ", prev=" + prev
                + ", next=" + next + ", displayPageNum=" + displayPageNum
                + ", cri=" + cri + "]";
    }


}
