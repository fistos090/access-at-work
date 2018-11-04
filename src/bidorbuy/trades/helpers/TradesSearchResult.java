package bidorbuy.trades.helpers;

public class TradesSearchResult {
	
	private TradeProduct[] trades;
	private long totalResults;
	private int pageNumber;
	private long resultsPerPage;
	
	
	public TradesSearchResult() {
		super();
	}

	public TradesSearchResult(TradeProduct[] trades, long totalResults, int pageNumber, long resultsPerPage) {
		super();
		this.trades = trades;
		this.totalResults = totalResults;
		this.pageNumber = pageNumber;
		this.resultsPerPage = resultsPerPage;
	}

	public TradeProduct[] getTrades() {
		return trades;
	}

	public void setTrades(TradeProduct[] trades) {
		this.trades = trades;
	}

	public long getTotalResults() {
		return totalResults;
	}

	public void setTotalResults(long totalResults) {
		this.totalResults = totalResults;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public long getResultsPerPage() {
		return resultsPerPage;
	}

	public void setResultsPerPage(long resultsPerPage) {
		this.resultsPerPage = resultsPerPage;
	}
	
	
}
