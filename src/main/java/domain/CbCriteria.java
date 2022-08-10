package domain;

//DAO 처리를 도와줄 Criteria 클래스

public class CbCriteria {

    private int page;	      //현재 조회하는 페이지의 번호
    private int perPageNum;	  //한 페이지당 출력하는 데이터의 개수
    private int rowStart;
    private int rowEnd;


    public CbCriteria(){
        this.page = 1;
        this.perPageNum = 8;
    }

    public void setPage(int page){

        if(page <= 0){
            this.page = 1;
            return;
        }

        this.page = page;
    }

    public void setPerPageNum(int perPageNum){

        if(perPageNum <= 0 || perPageNum > 100){
            this.perPageNum = 8;
            return;
        }

        this.perPageNum = perPageNum;
    }

    public int getPage() {
        return page;
    }

    //method for MyBatis SQL Mapper
    public int getPerPageNum(){
        return this.perPageNum;
    }

    public int getRowStart() {
        rowStart = ((page - 1) * perPageNum) + 1;
        return rowStart;
    }

    public int getRowEnd() {
        rowEnd = rowStart + perPageNum - 1;
        return rowEnd;
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
                + "]";
    }
}


