({
    createExpense : function(component, expense) {
        let theExpenses = component.get("v.expenses");
        // copy the expense to a new object
        // this is a disgusting, temporary hack
        let newExpense = JSON.parse(JSON.stringify(expense));
        console.log("Expenses before 'create': " + JSON.stringify(theExpenses));
        theExpenses.push(newExpense);
        component.set("v.expenses", tneExpenses);
        console.log("Expenses after 'create': " + JSON.stringify(theExpenses));
    }
})
