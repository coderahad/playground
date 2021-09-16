({
    createExpense : function(component, expense) {
        let theExpenses = component.get("v.expenses");
        // copy the expense to a new object
        // this is a disgusting, temporary hack
        let newExpense = JSON.parse(JSON.stringify(expense));
        theExpenses.push(newExpense);
        component.set("v.expenses", tneExpenses);
    }
})
