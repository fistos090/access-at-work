

function checkValidityAndShowSpinner(event) {

    let isFormValid = true;

    const resultsPerPage = document.getElementById("resultsPerPage").value;

    if (resultsPerPage !== '' && resultsPerPage) {
        if (resultsPerPage.includes('.')) {
            insertValidationMessage('results-per-page-vm', 'Only integer numbers are allowed');
            isFormValid = false;
        }
        if (isNaN(resultsPerPage)) {
            insertValidationMessage('results-per-page-vm', 'Only numbers are allowed');
            isFormValid = false;
        }
    }

    const tradeType = document.getElementById("TradeType").value;
    if (tradeType === '' || !tradeType) {
        insertValidationMessage('trade-type-vm', 'Please select trade type');
        isFormValid = false;
    }

    if (isFormValid) {
        document.getElementById("data-loader").style.display = 'block';
        document.getElementById("search-form").style.display = 'none';
    }

    return isFormValid;
}

function insertValidationMessage(messageAreaID, message) {
    if (messageAreaID) {
        const element = document.getElementById(messageAreaID);
        element.innerHTML = message;
        element.style.color = 'indianred';
    }
}