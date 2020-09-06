({
createAccount : function (component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Event"
    });
    createRecordEvent.fire();
   
    /*var eUrl= $A.get("e.force:navigateToURL");

    eUrl.setParams({

      "url": '00U/e?nooverride=1&retURL=%2F007'
	
    });

    eUrl.fire();*/

   
}
})