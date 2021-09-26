({
    clickCreate : function(component, event, helper) {
        let validExpense = component.find('expenseform').reduce(function(validSoFar, inputCmp) {
            // DIsplay error message for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            // console.log(inputCmp.get('v.validity', 'v.name'));
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // if we pass error checking, do some real work
        if(validExpense) {
            //create new expense
            let newExpense = component.get("v.newExpense");
            console.log("Create Expense: " + JSON.stringify(newExpense));
            helper.createExpense(component, newExpense);
        }
    },
    // LOad expenses from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        let action = component.get("c.getExpenses");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response){
            let stat = response.getState();
            if(stat === 'SUCCESS') {
                component.set("v.expenses", response.getReturnValue());
            }
            else {
                console.log('Failed with state: ' + stat);
            }
        });
        // send action off to be executed
        $A.enqueueAction(action);
    }
})
