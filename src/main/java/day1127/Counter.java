package day1127;

public class Counter {
	private int cnt;
	
	public Counter() {
		System.out.println("기본생성자");
		cnt=0;
	}//Counter

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}
	
}//class
