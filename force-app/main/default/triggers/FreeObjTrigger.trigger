trigger FreeObjTrigger on Freeobj__c (after insert,after update) {
    List<Freeobj__c>FreeobjcList=new List<Freeobj__c>();
    
    if(Trigger.isInsert&&Trigger.isAfter){
        
        for (Freeobj__c FreeObjNew: Trigger.new){
            
            if(FreeObjNew.Myname__c=='sf'){
                
            }   
        }        
    }
}