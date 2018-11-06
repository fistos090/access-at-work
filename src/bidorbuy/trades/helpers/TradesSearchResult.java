package bidorbuy.trades.helpers;

public class TradesSearchResult {
	
	private TradeProduct[] trades;
	private int totalResults;
	private int pageNumber;
	private int resultsPerPage;
	
	
	public TradesSearchResult() {
		super();
	}

	public TradesSearchResult(TradeProduct[] trades, int totalResults, int pageNumber, int resultsPerPage) {
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

	public int getTotalResults() {
		return totalResults;
	}

	public void setTotalResults(int totalResults) {
		this.totalResults = totalResults;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getResultsPerPage() {
		return resultsPerPage;
	}

	public void setResultsPerPage(int resultsPerPage) {
		this.resultsPerPage = resultsPerPage;
	}
	
	
}
