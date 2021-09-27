({
    handleUpdateExpense: function(component, event, helper) {
        let updateExp = event.getParam("expense");
        helper.updateExpense(component, updateExp);
    },
    handleCreateExpense: function(component, event, helper) {
        let newExpense = event.getParam("expense");
        helper.createExpense(component, newExpense);
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
