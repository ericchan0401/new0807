public class ProposeDao {
    public static List<Propose__c> getProposeRecById (String id) {
        List<Propose__c> ProposeList = [select Id, Name, MonthPrice__c, StartDay__c, Employee__r.FirstName__c, Employee__r.LastName__c from Propose__c where id =: id];
        return ProposeList;
    }


}