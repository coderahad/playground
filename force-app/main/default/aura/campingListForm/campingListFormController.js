({
    clickCreateItem : function(component, event, helper) {
        let validExpense = component.find('campinglistform').reduce(function(validSoFar, inputCmp) {
            // DIsplay error message for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validExpense) {
            //create new expense
            let newItem = component.get("v.newItem");
            console.log("Create Camp List: " + JSON.stringify(newItem));
            helper.createItem(component, newItem);
        }
    }
})