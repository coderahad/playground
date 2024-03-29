({
    handleClick : function(component, event, helper) {
        var btnClicked = event.getSource(); // the button
        var btnMessage = btnClicked.get("v.label"); // the button's label
        component.set("v.message", btnMessage);
    },
    handleClick2: function(component, event, helper) {
        let newMessage = event.getSource().get("v.label");
        component.set("v.message", newMessage);
    },
    handleClick3: function(component, event, helper) {
        component.set("v.message", event.getSource().get("v.label"));
    }
})