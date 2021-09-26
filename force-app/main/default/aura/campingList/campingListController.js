({
    clickCreateItem : function(component, event, helper) {
        let validExpense = component.find('campinglistform').reduce(function(validSoFar, inputCmp) {
            // DIsplay error message for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            // console.log(inputCmp.get('v.validity', 'v.name'));
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // if we pass error checking, do some real work
        if(validExpense) {
            //create new expense
            let newItem = component.get("v.newItem");
            console.log("Create Camp List: " + JSON.stringify(newItem));
            helper.createItem(component, newItem);
            // let theCampList = component.get("v.items");
            // // copy the list to a new object
            // let newCampList = JSON.parse(JSON.stringify(newItem));
            // theCampList.push(newCampList);
            // component.set("v.items", theCampList);
            // component.set("v.newItem", {'sobjectType' : 'Camping_Item__c','Name': '', 'Quantity__c': 0, 'Price__c': 0, 'Packed__c': false});
        }
    },
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
    }
})