({
    doInit: function(component, event, helper) {
        let action = component.get("c.getItems");

        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === 'SUCCESS') {
                component.set("v.items", response.getReturnValue())
            } else {
                console.log('Failed with state: ' + state);
            }
        })
        $A.enqueueAction(action);
    },
    handleAddItem: function(component, event, helper) {
        let newItem = event.getParam("item");
        // helper.createItem(component, newItem)
        let action = component.get("c.saveItem");
        action.setParams({
            //provide a JSON-style object with parameter name-parameter value pairs.
            // The one trick, and it’s important, is that your parameter name must match the parameter name used in your Apex method declaration.
            "item" : newItem
        })
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === 'SUCCESS') {
                let items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
    }
})