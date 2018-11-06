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
	
	%>

</head>

<body>

    <div class="container-fluid">
        <div class="row search-form-section">
            <div class="sidebar">
                <h5>Search bidorbuy trades</h5>
                <hr>
                <form id="search-form" action="${pageContext.request.contextPath}/search-bidorbuy-trades" onsubmit="return checkValidityAndShowSpinner()"
                    method="GET">

                    <div>
                        <label for="resultsPerPage">Number of results per page:</label>
                        <input class="text-input" style="margin-bottom: 5px;" type="text" id="resultsPerPage" name="resultsPerPage" placeholder=".e.g 30">
                    </div>

                    <div>
                        <input hidden class="text-input" style="margin-bottom: 5px;" type="text" id="pageNumber" name="pageNumber" value="1">
                    </div>

                    <div>
                        <label for="IncludedKeywords">Included keywords:</label>
                        <div class="included-keywords-checkboxs row" style=" margin: 0px;">
                            <div class="col-md-4" style="padding-top: 5px; padding-left: 10px;">
                                <input class="checkbox-input" type="checkbox" id="IncludedKeywords" name="IncludedKeywords"
                                    value="NEW"><label class="checkbox-input-label" for="">New</label>
                            </div>
                            <div class="col-md-4" style="padding-top: 5px; padding-left: 10px;">
                                <input class="checkbox-input" type="checkbox" id="IncludedKeywords" name="IncludedKeywords"
                                    value="SECOND_HAND"><label class="checkbox-input-label" for="">Second hand</label>
                            </div>
                            <div class="col-md-4" style="padding-top: 5px; padding-left: 10px;">
                                <input class="checkbox-input" type="checkbox" id="IncludedKeywords" name="IncludedKeywords"
                                    value="REFURBISHED"><label class="checkbox-input-label" for="">Refurbished</label>
                            </div>
                        </div>
                    </div>

                    <div>
                        <label for="TradeType">Trade type:</label>
                        <select name="TradeType" id="TradeType">
                            <option value="">-- Select trade type --</option>
                            <option value="ENGLISH_AUCTION">Auctions</option>
                            <option value="FIXED_PRICE">Buy nows</option>
                            <option value="CLASSIFIED_CONTACT">Classifieds</option>
                        </select>
                    </div>

                    <div>
                        <label for="OrderBy">Order by:</label>
                        <select name="OrderBy" id="OrderBy">
                            <option value="">-- Order of results --</option>
                            <option value="BidCount">BidCount</option>
                            <option value="Ending">Ending</option>
                            <option value="Opening">Opening</option>
                            <option value="Title">Title </option>
                        </select>
                    </div>
                    <hr>
                    <button type="submit"> <i class="fas fa-search"></i> Search</button>
                </form>

                <div id="data-loader" class="data-loader">
                    <i class="fas fa-spinner fa-spin"></i> searching... 
                </div>
            </div>
        </div>
    </div>

    <script src="js/bidorbuy-jsscript.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>


</html>