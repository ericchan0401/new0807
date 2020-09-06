({
    handleClick : function(component, event, helper) {
        var buttonClicked = event.getSource(); //the button
        var buttonLabel = buttonClicked.get("v.label"); //the button's label; 
        var customerName = '';
        if(buttonLabel.indexOf("Mary") > -1) {
            customerName = "Mary";
        } else {
            customerName = "Clark";
        }
         
        component.set("v.customerName", customerName);
        buttonClicked.set("v.label", buttonLabel + " clicked");
    }
})