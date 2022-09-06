({
    packItem : function(component, event, helper) {
        //get the main component in a new variable
        var newItem = event.getSource().get('v.label');
        var comp = component.get("v.item", true);
        console.log(newItem);
        console.log(comp);
        comp.Packed__c = true;
        component.set("v.item", comp);
        event.getSource().set("v.disabled", true);
    }
})