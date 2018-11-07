package bidorbuy.trades.servlets;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.Locale;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bidorbuy.trades.helpers.TradeProduct;
import bidorbuy.trades.helpers.TradeProductImage;
import bidorbuy.trades.helpers.TradesSearchResult;

/**
 * Servlet implementation class TradesSearchServlet
 */
@WebServlet(name = "search-bidorbuy-trades", description = "This servlet used for fetching trades' data from Bid or Buy web service", urlPatterns = {
		"/search-bidorbuy-trades" })
public class TradesSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TradesSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TradesSearchResult searchResult = null;

		HttpSession session = request.getSession();

		// Prepare parameters for Bid or Buy web service
		Enumeration<String> requestParameters = request.getParameterNames();

		boolean hasMore = requestParameters.hasMoreElements();

		if (hasMore) {

			String webServiceRequestParams = "";

			while (hasMore) {
				String paramName = requestParameters.nextElement();
				String paramValue = "";

				if (paramName.equals("IncludedKeywords")) {

					String[] paramsValues = request.getParameterValues(paramName);
					
					if ( paramsValues.length == 1) {
						if (paramsValues[0].contains(" ")) {
							paramsValues = paramsValues[0].split(" ");
						}
					}
					
					paramValue =  String.join("%20", paramsValues);
					
				} else {
					paramValue = request.getParameter(paramName);
				}
				
				session.setAttribute(paramName, paramValue);
				webServiceRequestParams += paramName + "=" + paramValue;
				
				hasMore = requestParameters.hasMoreElements();

				if (hasMore) {
					webServiceRequestParams += "&";
				}

			}

			// Open connection to Bid or Buy web server

			String bidorbuyWebServiceUrl = "https://demo.bidorbuy.co.za/services/v3/tradesearch?"
					+ webServiceRequestParams;

			URL bidorbuyWebServiceUrlObj = new URL(bidorbuyWebServiceUrl);
			HttpURLConnection connToBidOrBuyWebService = (HttpURLConnection) bidorbuyWebServiceUrlObj.openConnection();

			// Set request header fields
			connToBidOrBuyWebService.setRequestProperty("X-BOB-AUTHID", "kfpP9jzHLmoTqRBtzGvxkYYF2GzfWfWhtgHGZVpB");
			connToBidOrBuyWebService.setRequestProperty("X-BOB-PLATFORM", "4");
			connToBidOrBuyWebService.setRequestProperty("X-BOB-CID", "987654321");

			// Get data from the web service
			JsonReader jreader = Json.createReader(connToBidOrBuyWebService.getInputStream());

			if (jreader != null) {

				JsonObject jObject = jreader.readObject();

				if (jObject != null) {

					JsonArray tradesArray = jObject.getJsonArray("trade");

					if (tradesArray != null) {

						TradeProduct[] tradeProducts = new TradeProduct[tradesArray.size()];
						int pageNumber = jObject.getInt("pageNumber");
						int totalResults = jObject.getInt("totalResults");
						int resultsPerPage = jObject.getInt("resultsPerPage");

						for (int x = 0; x < tradesArray.size(); x++) {
							TradeProduct tradeProduct = new TradeProduct();

							JsonObject tradeJsonObj = tradesArray.getJsonObject(x);

							tradeProduct.setTitle(tradeJsonObj.getString("title"));
							tradeProduct.setUserAlias(tradeJsonObj.getString("userAlias"));
							tradeProduct.setStatus(tradeJsonObj.getString("status"));
							tradeProduct.setType(tradeJsonObj.getString("type"));
							tradeProduct.setLocation(tradeJsonObj.getString("location"));
							tradeProduct.setCategoryBreadCrumb(tradeJsonObj.getString("categoryBreadCrumb"));

							tradeProduct.setAmount(tradeJsonObj.getJsonNumber("amount").doubleValue());

							tradeProduct.setUserId(tradeJsonObj.getJsonNumber("userId").longValue());
							tradeProduct.setTradeId(tradeJsonObj.getJsonNumber("tradeId").longValue());
							tradeProduct.setHomeCategoryId(tradeJsonObj.getJsonNumber("homeCategoryId").longValue());
							tradeProduct.setHotSelling(tradeJsonObj.getBoolean("hotSelling"));
							tradeProduct.setOpenTime(tradeJsonObj.getString("openTime"));
							tradeProduct.setCloseTime(tradeJsonObj.getString("closeTime"));

							JsonArray tradeJsonObjImages = tradeJsonObj.getJsonArray("images");

							if (tradeJsonObjImages != null) {
								TradeProductImage[] images = new TradeProductImage[tradeJsonObjImages.size()];

								for (int z = 0; z < tradeJsonObjImages.size(); z++) {
									String imageUrl = tradeJsonObjImages.getJsonObject(z).getString("image");
									String thumbnailUrl = tradeJsonObjImages.getJsonObject(z).getString("thumbnail");

									images[z] = new TradeProductImage(imageUrl, thumbnailUrl);
								}

								tradeProduct.setImages(images);
							}

							tradeProducts[x] = tradeProduct;

						}

						searchResult = new TradesSearchResult(tradeProducts, totalResults, pageNumber, resultsPerPage);

						session.setAttribute("searchResult", searchResult);
					}

				}

			}

			response.sendRedirect("search-results.jsp");
			
//			request.getRequestDispatcher("search-results.jsp").forward(request, response);
		}
	}

}
