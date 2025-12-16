package kr.co.sist.board;

import java.sql.SQLException;
import java.util.List;

import javax.print.attribute.standard.PagesPerMinute;

public class BoardService {
	private static BoardService bs;
	
	private BoardService() {
	}
	
	public static BoardService getInstance() {
		if(bs== null) {
			bs=new BoardService();
		}//end if
		return bs;
	}//getInstance
	
	/**
	 * 총게시물의 수
	 * @param rDTO
	 * @return
	 */
	public int totalCnt(RangeDTO rDTO) {
		int totalCnt=0;
		BoardDAO bDAO=BoardDAO.getInstance();
		
		try {
			totalCnt=bDAO.selectBoardTotalCnt( rDTO );
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return totalCnt;
	}//totalCnt
	
	/**
	 * 한 화면에 보여줄 페이지의 수
	 * @return
	 */
	public int pageScale() {
		return 10;
	}//pageScale
	
	/**
	 *  총페이지수
	 * @param totalCount -전체 게시물의 수 
	 * @param pageScale -한 화면에 보여줄 게시물의 수
	 * @return
	 */
	public int totalPage(int totalCount, int pageScale) { 
		return (int)Math.ceil((double)totalCount/pageScale);
	}//totalPage
	
	/**
	 * 페이지의 시작번호 구하기
	 * @param currentPage - 현재 페이지
	 * @param pageScale - 한 화면에 보여줄 게시물의 수
	 * @return
	 */
	public int startNum(int currentPage , int pageScale) {
		return currentPage * pageScale-pageScale+1;
	}//startNum
	
	/**
	 * 페이지의 끝번호 구하기
	 * @param startNum - 시작번호
	 * @param pageScale - 한 화면에 보여줄 게시물의 수
	 * @return
	 */
	public int endNum(int startNum, int pageScale) {
		return startNum+pageScale-1;
	}//endNum
	
	public boolean addBoard(BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDAO.insertBoard(bDTO);
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//addBoard
	
	/**
	 * 시작번호, 끝번호, 검색필드, 검색 키워드를 사용한 게시글 검색
	 * @param rDTO
	 * @return
	 */
	public List<BoardDTO> searchBoardList( RangeDTO rDTO){
		List<BoardDTO> list=null;
		
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			list=bDAO.selectRangeBoard(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchBoardList
	
	/**
	 * 제목이 20자를 초과하면 19자까지 보여주고 뒤에 ...을 붙이는 일
	 * @param list
	 */
	public void titleSubStr(List<BoardDTO> boardList) {
		String title="";
		for(BoardDTO bDTO:boardList){
			title=bDTO.getTitle();
			if(title.length() > 19){
				bDTO.setTitle(title.substring(0,20)+"...");
			}//end if
		}//end for
	}//titleSubStr
	
	/**
	 * 페이지네이션 [<<] ... [1][2][3] ... [>>]
	 * @param rDTO
	 * @return
	 */
	public String pagination( RangeDTO rDTO ) {
		StringBuilder pagination=new StringBuilder();
		//1. 한 화면에 보여줄 pagination의 수.
		int pageNumber=3;
		//2. 화면에 보여줄 시작페이지 번호. 1,2,3 => 1로 시작 , 4,5,6=> 4, 7,8,9=>7
		int startPage= ((rDTO.getCurrentPage()-1)/pageNumber)*pageNumber+1;
		//3. 화면에 보여줄 마지막 페이지 번호 1,2,3 =>3
		int endPage= (((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//4. 총페이지수가 연산된 마지막 페이지수보다 작다면 총페이지 수가 마지막 페이지수로 설정
		//456 인경우 > 4로 설정
		if( rDTO.getTotalPage() <= endPage) {
			endPage=rDTO.getTotalPage();
		}//end if
		//5.첫페이지가 인덱스 화면 (1페이지) 가 아닌 경우
		int movePage=0;
		StringBuilder prevMark=new StringBuilder();
		prevMark.append("[&lt;&lt;]");
		//prevMark.append("<li class='page-item'><a class='page-link' href='#'>Previous</a></li>");
		if(rDTO.getCurrentPage() > pageNumber) {// 시작페이지 번호가 3보다 크면 
			movePage=startPage-1;// 4,5,6->3 ->1 , 7 ,8 ,9 -> 6 -> 4
			prevMark.delete(0, prevMark.length());// 이전에 링크가 없는 [<<] 삭제
			prevMark.append("[ <a href='").append(rDTO.getUrl())
			.append("?currentPage=").append(movePage);
			//검색 키워드가 있다면 검색 키워드를 붙인다.
			if( rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty() ) {
				prevMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}//end if
			prevMark.append("' class='prevMark'>&lt;&lt;</a> ]");
		}//end if
		
		//6.시작페이지 번호부터 끝 번호까지 화면에 출력
		StringBuilder pageLink=new StringBuilder();
		movePage=startPage;
		
		while( movePage <= endPage ) {
			if( movePage == rDTO.getCurrentPage()) { //현재 페이지 : 링크 x
				pageLink.append("[ <span class='currentPage'>")
				.append(movePage).append("</span> ]");
			}else {//현재페이지가 아닌 다른 페이지 : 링크 O
				pageLink.append("[ <a class='notCurrentPage' href='")
				.append(rDTO.getUrl()).append("?currentPage=").append(movePage);
				//검색 키워드가 있다면 검색 키워드를 붙인다.
				if( rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty() ) {
					pageLink.append("&field=").append(rDTO.getField())
					.append("&keyword=").append(rDTO.getKeyword());
				}//end if
				pageLink.append("'>").append(movePage).append("</a> ]");
				
			}//else
			
			movePage++;
		}//end while
		
		//7. 뒤에 페이지가 더 있는 경우
		StringBuilder nextMark=new StringBuilder("[ &gt;&gt; ]");
		if( rDTO.getTotalPage() > endPage) { // 뒤에 페이지가 더 있음.
			movePage= endPage+1;
			nextMark.delete(0, nextMark.length());
			nextMark.append("[ <a class='nextMark' href='")
			.append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			if( rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty() ) {
				nextMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}//end if
			
			nextMark.append("'>&gt;&gt;</a> ] ");
			
		}//end if
		
		pagination.append(prevMark).append(" ... ").append(pageLink)
		.append(" ... ").append(nextMark);
		
		return pagination.toString();
	}//pagination
	
	public String pagination2( RangeDTO rDTO, String justify ) {
		StringBuilder pagination=new StringBuilder();
		//1. 한 화면에 보여줄 pagination의 수.
		int pageNumber=3;
		//2. 화면에 보여줄 시작페이지 번호. 1,2,3 => 1로 시작 , 4,5,6=> 4, 7,8,9=>7
		int startPage= ((rDTO.getCurrentPage()-1)/pageNumber)*pageNumber+1;
		//3. 화면에 보여줄 마지막 페이지 번호 1,2,3 =>3
		int endPage= (((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//4. 총페이지수가 연산된 마지막 페이지수보다 작다면 총페이지 수가 마지막 페이지수로 설정
		//456 인경우 > 4로 설정
		if( rDTO.getTotalPage() <= endPage) {
			endPage=rDTO.getTotalPage();
		}//end if
		//5.첫페이지가 인덱스 화면 (1페이지) 가 아닌 경우
		int movePage=0;
		StringBuilder prevMark=new StringBuilder();
		prevMark.append("<li class='page-item disabled'>");
		prevMark.append("<a class='page-link'>Previous</a>");
		prevMark.append("</li>");
		//prevMark.append("<li class='page-item'><a class='page-link' href='#'>Previous</a></li>");
		if(rDTO.getCurrentPage() > pageNumber) {// 시작페이지 번호가 3보다 크면 
			movePage=startPage-1;// 4,5,6->3 ->1 , 7 ,8 ,9 -> 6 -> 4
			prevMark.delete(0, prevMark.length());// 이전에 링크가 없는 [<<] 삭제
			prevMark.append("<li class='page-item'><a class='page-link' href='").append(rDTO.getUrl())
			.append("?currentPage=").append(movePage);
			//검색 키워드가 있다면 검색 키워드를 붙인다.
			if( rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty() ) {
				prevMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}//end if
			prevMark.append("'>Previous</a></li>");
		}//end if
		
		//6.시작페이지 번호부터 끝 번호까지 화면에 출력
		StringBuilder pageLink=new StringBuilder();
		movePage=startPage;
		
		while( movePage <= endPage ) {
			if( movePage == rDTO.getCurrentPage()) { //현재 페이지 : 링크 x
				pageLink.append("<li class='page-item active page-link'>") 
				.append(movePage).append("</li>");
			}else {//현재페이지가 아닌 다른 페이지 : 링크 O
				pageLink.append("<li class='page-item'><a class='page-link' href='")
				.append(rDTO.getUrl()).append("?currentPage=").append(movePage);
				//검색 키워드가 있다면 검색 키워드를 붙인다.
				if( rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty() ) {
					pageLink.append("&field=").append(rDTO.getField())
					.append("&keyword=").append(rDTO.getKeyword());
				}//end if
				pageLink.append("'>").append(movePage).append("</a>");
				
			}//else
			
			movePage++;
		}//end while
		
		//7. 뒤에 페이지가 더 있는 경우
		StringBuilder nextMark=new StringBuilder("<li class='page-item page-link'>Next</li>");
		if( rDTO.getTotalPage() > endPage) { // 뒤에 페이지가 더 있음.
			movePage= endPage+1;
			nextMark.delete(0, nextMark.length());
			nextMark.append("<li class='page-item page-link'><a href='")
			.append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			if( rDTO.getKeyword() != null && !rDTO.getKeyword().isEmpty() ) {
				nextMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}//end if
			
			nextMark.append("'>Next</a></li>");
			
		}//end if
		
		if(!("center".equals(justify) || "left".equals(justify))) {
			justify="left";
		}
		pagination.append("<nav aria-label='...'>")
		.append("  <ul class='pagination d-flex justify-content-")
		.append(justify)
		.append("'>");
		pagination.append(prevMark).append(pageLink).append(nextMark);
		pagination.append("</ul>")
		.append("  </nav>");
		
		return pagination.toString();
	}//pagination
	
	/**
	 * 상세보기
	 * @param num
	 * @return
	 */
	public BoardDTO searchOneBoard( int num ) {
		BoardDTO bDTO=null;
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDTO=bDAO.selectBoardDetail(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return bDTO;
	}//searchOneBoard
	
	public void modifyBoardCnt( int num ) {
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			bDAO.updateBoardCnt(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
	}//modifyBoardCnt
	
	public boolean modifyBoard( BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			 flag=bDAO.updateBoard(bDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//modifyBoard
	public boolean removeBoard( BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO=BoardDAO.getInstance();
		try {
			flag=bDAO.deleteBoard(bDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//removeBoard
	
	
}//class
