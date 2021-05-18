global class CustomWebClass {
    webservice static Id makeJ(Candidate__c c) { 
        Candidate__c j = new Candidate__c();
        j.Name = 'fromWeb' + c.Name;
        j.City__c = 'fromWeb' + c.City__c;
        insert j;
        return j.id;
    }
}