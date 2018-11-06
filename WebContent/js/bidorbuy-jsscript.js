

function checkValidityAndShowSpinner(event) {

    let isFormValid = true;

    const resultsPerPage = document.getElementById("resultsPerPage").value;
    const tradeType = document.getElementById("TradeType").value;
    const orderBy = document.getElementById("OrderBy").value;


    if (isNaN(resultsPerPage)) {
        insertValidationMessage(id,'Only numbers are allowed');
        isFormValid = false;
    }
    else {
        if (resultsPerPage !== '') {
            if (resultsPerPage.includes('.')) {
                insertValidationMessage(id,'Only integer numbers are allowed');
            }
        }


    }



    console.log("resultsPerPageresultsPerPage", resultsPerPage)

    if (isFormValid) {
        document.getElementById("data-loader").style.display = 'block';
        document.getElementById("search-form").style.display = 'none';
    }

    return isFormValid;
}

function insertValidationMessage( messageAreaID, message ){
    if (messageAreaID) {
        document.getElementById(messageAreaID).innerHTML = message;
    }
}