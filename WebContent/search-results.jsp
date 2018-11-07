<%@page import="bidorbuy.trades.helpers.TradeProduct"%>
<%@page import="bidorbuy.trades.helpers.TradesSearchResult"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "f"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>bidorbuy Trades Search Engine:Results</title>
    <link rel="stylesheet" type="text/css" href="css/bidorbuy-stylesheet.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">

    <%
        TradesSearchResult searchResult = (TradesSearchResult) session.getAttribute("searchResult");
        
        String resultsPerPage = (String) session.getAttribute("resultsPerPage");
        String IncludedKeywords = (String) session.getAttribute("IncludedKeywords");
        String TradeType = (String) session.getAttribute("TradeType");
        String OrderBy = (String) session.getAttribute("OrderBy");

        System.out.println("IncludedKeywords "+ IncludedKeywords);
        int pageNumber = searchResult.getPageNumber()+1;

        String loadNextPgParams = "search-bidorbuy-trades?resultsPerPage="+resultsPerPage
                                +"&pageNumber="+pageNumber
                                +"&IncludedKeywords="+IncludedKeywords
                                +"&TradeType="+TradeType+
                                "&OrderBy="+OrderBy;

        pageNumber = searchResult.getPageNumber()-1;
                                
        String loadPreviousPgParams = "search-bidorbuy-trades?resultsPerPage="+resultsPerPage
                                    +"&pageNumber="+pageNumber
                                    +"&IncludedKeywords="+IncludedKeywords
                                    +"&TradeType="+TradeType+"&OrderBy="+OrderBy;
                                      
        int totalNumOfPages = searchResult.getTotalResults() > searchResult.getResultsPerPage() ? 
                                (searchResult.getTotalResults() / searchResult.getResultsPerPage()) : searchResult.getPageNumber();
     

        %>
</head>

<body>

    <div class="top-nav">
        <span>
            <f:formatNumber type="number" var="convertedTotalNumOfPages" value="<%= totalNumOfPages %>" />
            Page : [ ${searchResult.getPageNumber()} of
            <c:out value="${convertedTotalNumOfPages}" /> ]
        </span>
        <a href="index.jsp" class="back-link">
            <i class="fas fa-long-arrow-alt-left"></i> Back to search
        </a>
    </div>
    <div class="container">
        <table class="results-table">
            <tr class="row results-table-head">
                <th colspan="2">
                    bidorbuy trades details: Search results
                    <ul class="results-pager">
                        <c:if test="${searchResult.getPageNumber() > 1}">
                            <li><a href="<%= loadPreviousPgParams %>">Previous</a></li>
                        </c:if>
                        <c:if test="${searchResult.getPageNumber() > 0 && searchResult.getPageNumber() < searchResult.getTotalResults() / searchResult.getResultsPerPage()}">
                            <li style="padding-left: 23px"><a href="<%= loadNextPgParams %>">Next</a></li>
                        </c:if>
                    </ul>
                </th>
            </tr>
            <c:forEach varStatus="loop" items="${searchResult.getTrades()}" var="tradeProd">
                <tr class="row results-table-body">
                    <td class="col-md-3">
                        <img src="${tradeProd.getImages()[0].getImageUrl()}" alt="${tradeProd.images[0].getThumbnailUrl()}">
                    </td>
                    <td class="col-md-9">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Product title</label>
                                <c:out value="${tradeProd.getTitle()}" />
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <span class="col-md-4">
                                <label for="">Amount</label>
                                <f:formatNumber var="amount" type="number" minFractionDigits="2" value="${tradeProd.getAmount()}" />
                                R
                                <c:out value="${amount}" />
                            </span>
                            <span class="col-md-4">
                                <label for="">Opening Date</label>
                                <c:out value="${tradeProd.getOpenTime()}" />
                                <label for="">Closing Date</label>
                                <c:out value="${tradeProd.getCloseTime()}" />
                            </span>
                            <span class="col-md-4"></span>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>
<script src="js/bidorbuy-jsscript.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</html>