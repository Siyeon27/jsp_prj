package kr.co.sist.calendar;

public class CalendarDTO {
	private String paramYear, paramMonth;

	public String getParamYear() {
		return paramYear;
	}

	public void setParamYear(String paramYear) {
		this.paramYear = paramYear;
	}

	public String getParamMonth() {
		return paramMonth;
	}

	public void setParamMonth(String paramMonth) {
		this.paramMonth = paramMonth;
	}

	@Override
	public String toString() {
		return "CalendarDTO [paramYear=" + paramYear + ", paramMonth=" + paramMonth + "]";
	}
	
}
