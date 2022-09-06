({
    createItem : function(component, item) {
        let addItem = component.getEvent("addItem");
        addItem.setParams({
            "item": item
        });
        addItem.fire();
        let resetNewItem = "{'sobjectType' : 'Camping_Item__c','Name': '', 'Quantity__c': 0, 'Price__c': 0, 'Packed__c': false}";
        component.set("v.newItem",resetNewItem);
        // let action = component.get("c.saveItem");
        // action.setParams({
        //     //provide a JSON-style object with parameter name-parameter value pairs.
        //     // The one trick, and it’s important, is that your parameter name must match the parameter name used in your Apex method declaration.
        //     "citem" : item
        // })
        // action.setCallback(this, function(response){
        //     let state = response.getState();
        //     if(state === 'SUCCESS') {
        //         let items = component.get("v.items");
        //         items.push(response.getReturnValue());
        //         component.set("v.items", items);
        //     }
        // });
        // $A.enqueueAction(action);
    }
})