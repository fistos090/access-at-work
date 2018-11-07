<%@page import="bidorbuy.trades.helpers.TradeProduct"%>
<%@page import="bidorbuy.trades.helpers.TradesSearchResult"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
        /* TradesSearchResult searchResult = (TradesSearchResult) session.getAttribute("searchResult");
        
        String resultsPerPage = (String) session.getAttribute("resultsPerPage");
        String IncludedKeywords = (String) session.getAttribute("IncludedKeywords");
        String TradeType = (String) session.getAttribute("TradeType");
        String OrderBy = (String) session.getAttribute("OrderBy");

        String loadNextPgParams = "****";
         loadNextPgParams = "search-bidorbuy-trades/?resultsPerPage="+resultsPerPage+"&pageNumber=3"+
                                  "&IncludedKeywords="+IncludedKeywords+"&TradeType="+TradeType+"&OrderBy="+OrderBy;

        String loadPreviousPgParams = "search-bidorbuy-trades/?resultsPerPage="+resultsPerPage+"&pageNumber="+(searchResult.getPageNumber()-1)+
                                      "&IncludedKeywords="+IncludedKeywords+"&TradeType="+TradeType+"&OrderBy="+OrderBy;
                                      System.out.println("loadNextPgParams "+loadNextPgParams); */
     %>
</head>

<body>

    <!-- <div class="top-nav">
            <span>
                Page number: [ ${searchResult.getPageNumber()} of ${searchResult.getTotalResults() >
                searchResult.getResultsPerPage() ? (searchResult.getTotalResults() / searchResult.getResultsPerPage())
                : searchResult.getPageNumber()} ]
            </span>

            <a href="index.jsp" class="back-link">
                Back to search
            </a>
        </div>
        <div class="container">
               fgdfgdfgfdg  <c:out value="${loadNextPgParams}" />
            <table class="results-table">
                <tbody>
                    <tr class="row">
                        <th colspan="2" class="col-md-12" style="padding: 0px">
                            Search results: Trade products details
                            <ul class="results-pager">
                                <li><a href="${loadPreviousPgParams}">Previous</a></li>
                                <li style="padding-left: 23px"><a href="${loadNextPgParams}">Next</a></li>
                            </ul>
                        </th>
                    </tr>
                    <c:forEach items="${searchResult.getTrades()}" var="tradeProd">
                        <tr class="row">
                            <td class="col-md-2">
                                <img height="120" width="125" src="${tradeProd.getImages()[0].getImageUrl()}" alt="${tradeProd.images[0].getThumbnailUrl()}">
                            </td>
                            <td class="col-md-10">
                                <c:out value="${tradeProd.getTitle()}" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div> -->

    <div class="top-nav">
        <a href="index.jsp" class="back-link">
            <i class="fas fa-long-arrow-alt-left"></i> Back to search
        </a>
    </div>
    <div class="container">
        <table class="results-table">
            <tr class="row results-table-head">
                <th colspan="2">bidorbuy trades details: Search results</th>
            </tr>
            <tr class="row results-table-body">
                <td class="col-md-2">
                    <img height="140" width="160" src="home-back.png" />
                    <!-- <img height="120" width="125" src="${tradeProd.getImages()[0].getImageUrl()}" alt="${tradeProd.images[0].getThumbnailUrl()}"> -->
                </td>
                <td class="col-md-10">
                    <div class="row">
                        <label for="">Product title</label>
                        Simba chips
                    </div>
                    <div class="row">
                        <span class="col-md-6">
                            <label for="">Amount</label>
                            R 20.00
                        </span>
                        <span class="col-md-6">
                            <label for="">recommended Retail Price</label>
                            R 21.50
                        </span>
                    </div>

                </td>
            </tr>

        </table>
    </div>

</body>
<script src="js/bidorbuy-jsscript.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</html>