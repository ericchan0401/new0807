trigger trigger11 on Applicant__c (before insert) {
List<Employee__c> EmployeeList = new List<Employee__c>();
    if((Trigger.isAfter && Trigger.isInsert)||(Trigger.isUpdate && Trigger.isAfter)){
         for(Applicant__c ApplicantNew : Trigger.new){
            if(ApplicantNew.Status__c == '採用'){
              Employee__c Employee = new Employee__c();
                Employee.Name = ApplicantNew.Name;
                Employee.FirstName__c = ApplicantNew.FirstName__c;
                Employee.LastName__c = ApplicantNew.LastName__c;
                Employee.Birthday__c = ApplicantNew.Birthday__c;
                Employee.Phone__c = ApplicantNew.Tel__c;
                Employee.JoinDate__c = ApplicantNew.JoinPlanDate__c;
                Employee.JapaneseLevel__c = ApplicantNew.JapaneseLevel__c;
                Employee.JapaneseCertification__c = ApplicantNew.JapaneseCertification__c;
                EmployeeList.add(Employee);
            }
        }
        if(EmployeeList.size()>0){
            upsert EmployeeList;
        } 
    }
}