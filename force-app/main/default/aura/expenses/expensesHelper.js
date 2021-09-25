({
    createExpense : function(component, expense) {
        let action = component.get("c.saveExpense");
        action.setParams({
            "expense": expense
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === 'SUCCESS') {
                let expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                // Here the expense attribute updated only in the component. It is not called all records again from the server. 
                //the attribute get the records initially when the component loads with the help of doInit function.
                component.set("v.expenses", expenses);
            }
        });
        $A.enqueueAction(action);
    }
})
