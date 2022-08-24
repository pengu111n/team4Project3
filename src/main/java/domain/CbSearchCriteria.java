package domain;

//검색에 필요한 데이터를 담는다
public class CbSearchCriteria extends CbCriteria{

    private String searchType; //검색의 종류
    private String keyword;    //키워드

    public String getSearchType() {
        return searchType;
    }
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }
    public String getKeyword() {
        return keyword;
    }
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
    @Override
    public String toString() {
        return super.toString() + " SearchCriteria "
                + "[searchType=" + searchType + ", keyword="
                + keyword + "]";
    }
}