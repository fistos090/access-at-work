<%@page import="bidorbuy.trades.helpers.TradeProduct"%>
<%@page import="bidorbuy.trades.helpers.TradesSearchResult"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>BidorBuy Trades Search Engine</title>
    <link rel="stylesheet" type="text/css" href="css/bidorbuy-stylesheet.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns"
        crossorigin="anonymous">
    <%
	 TradesSearchResult searchResult = (TradesSearchResult) session.getAttribute("searchResult");
	%>

</head>

<body>

    <div class="container-fluid">
        <div class="row search-form-section">
            <aside class="col-md-3 sidebar">
                <h5>Bid or Buy trades search</h5>
                <form action="${pageContext.request.contextPath}/search-bidorbuy-trades" onsubmit="return checkValidityAndShowSpinner()"
                    method="GET">
                    <input style="margin-bottom: 5px;" type="text" name="resultsPerPage" value="20">
                    <input style="margin-bottom: 5px;" type="text" name="pageNumber" value="1">
                    <input style="margin-bottom: 5px;" type="text" name="IncludedKeywords" value="REFURBISHED">
                    <input style="margin-bottom: 5px;" type="text" name="TradeType" value="CLASSIFIED_CONTACT">
                    <input style="margin-bottom: 5px;" type="text" name="OrderBy" value="Title">

                    <button type="submit"> <i class="fas fa-search"></i> Search</button>
                </form>
            </aside>
            <section class="col-md-9">
                <c:forEach items="${searchResult.getTrades()}" var="tradeProd">
                    ${tradeProd.getTitle()}<br>
                </c:forEach>
            </section>

        </div>
    </div>

    <script src="js/bidorbuy-jsscript.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>


</html>