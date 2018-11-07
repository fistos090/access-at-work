

function checkValidityAndShowSpinner() {

    let isFormValid = true;

    const resultsPerPage = document.getElementById('resultsPerPage').value;

    if (resultsPerPage !== '' && resultsPerPage) {
        if (isNaN(resultsPerPage)) {
            insertValidationMessage('results-per-page-vm', '  Only numbers are allowed');
            isFormValid = false;
        }
        if (resultsPerPage.includes('.')) {
            insertValidationMessage('results-per-page-vm', '  Only integer numbers are allowed');
            isFormValid = false;
        }
    }

    const tradeType = document.getElementById('TradeType').value;
    if (tradeType === '' || !tradeType) {
        insertValidationMessage('trade-type-vm', '  Please select trade type');
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
        const messageAreaElement = document.getElementById(messageAreaID);
        messageAreaElement.innerHTML = message;
        messageAreaElement.style.display = 'block';
        messageAreaElement.style.color = 'rgb(234, 60, 60)';
    }

}

function removeValidationMessage(messageAreaID) {

    if (messageAreaID) {
        const messageAreaElement = document.getElementById(messageAreaID);
        messageAreaElement.innerHTML = '';
        messageAreaElement.style.display = 'none';
    }

}