@isTest
public class AnkensearchcontrollerTest {
    static testMethod void test_int_01(){
        ankenSearchController ankenobj = new AnkenSearchController();
        system.test.startTest();
        Employee__c employee=new Employee__c(name='chenmin',FirstName__c='chen', Birthday__c=date.today(), Phone__c='08040672233', JoinDate__c=date.today());
        insert employee;
        PageReference pageRef=Page.Ankensearch;
        system.Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id',employee.id);
        ankenobj.init();
        System.test.stopTest();
        System.assertEquals(false, ankenobj.isSystemErrorFlg);
      
    }
      

}