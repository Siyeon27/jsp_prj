package day1127;

public class DataDTO {
	private String name;
	private int myAge;
	
	public DataDTO() {
		System.out.println("DataDTO의 기본생성자");
	}

	public DataDTO(String name, int myAge) {
		System.out.println("DataDTO의 인자있는 생성자");
		this.name = name;
		this.myAge = myAge;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMyAge() {
		return myAge;
	}

	public void setMyAge(int myAge) {
		this.myAge = myAge;
	}

	@Override
	public String toString() {
		return "DataDTO [name=" + name + ", myAge=" + myAge + "]";
	}

}
