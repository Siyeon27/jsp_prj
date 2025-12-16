package day1201;

import java.util.Date;

public class ProductDTO {
	private String img, title, info;
	private int price;
	private Date prdDate;
	
	public ProductDTO() {
	}

	public ProductDTO(String img, String title, String info, int price, Date prdDate) {
		this.img = img;
		this.title = title;
		this.info = info;
		this.price = price;
		this.prdDate = prdDate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPrdDate() {
		return prdDate;
	}

	public void setPrdDate(Date prdDate) {
		this.prdDate = prdDate;
	}

	@Override
	public String toString() {
		return "ProductDTO [img=" + img + ", title=" + title + ", info=" + info + ", price=" + price + ", prdDate="
				+ prdDate + "]";
	}
	
}
