package bidorbuy.trades.helpers;

public class TradeProductImage {
	private String imageUrl;
	private String thumbnailUrl;
	
	public TradeProductImage() {
		super();
	}
	
	
	public TradeProductImage(String imageUrl, String thumbnailUrl) {
		super();
		this.imageUrl = imageUrl;
		this.thumbnailUrl = thumbnailUrl;
	}


	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	
	
}
