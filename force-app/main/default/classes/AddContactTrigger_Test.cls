//Positive path Test
@isTest// (seeAllData = true) in order to see pre-existing data queried by SOQL
public class AddContactTrigger_Test {
    // Test can not take parameters on methods
    static testMethod void  positivePath_TestOneCandidate() {
        Candidate__c cand = new Candidate__c(Name= 'TriggerTest', City__c= 'Hiroshima');
        Database.insert(cand);

        Contact ctct = [SELECT LastName, MailingCity FROM Contact WHERE LastName= 'TriggerTest' and MailingCity = 'Hiroshima'];
        System.assert(ctct.LastName == cand.Name);
        System.assert(ctct.MailingCity == cand.City__c);
    }
    // Call Test.loadData() in a test method to populate the test
    static testMethod void positivePath_StaticResourceTest() {
        List<SObject> cands = Test.loadData(Candidate__c.sObjectType, 'testCandidates');
        integer num_cands = cands.size();

        List<Contact> ctcts = [SELECT LastName,MailingCity FROM Contact WHERE LastName LIKE 'TestCan'];
        System.assert(num_cands == ctcts.size());
        for(integer i; i < num_cands; i++) {
            Candidate__c c = (Candidate__c) cands[i];
            System.assert(c.Name == ctcts[i].LastName);
            System.assert(c.City__c == ctcts[i].MailingCity);
        }

        /**
         static testMethod void myTest() {
             .. // Initialize Data for test
             insert myTestData;
             .. // Prepare Data for test
             Test.statTest();
             update myTestData(); // execute business logic
             Test.stopTest();
             .. // get results from the database
             System.assert(..);
         }
         */
    }
}

// Negative Path test
/**
 * 
 @isTest
 private class AddContactTrigger_Test {
     static testMethod void negativePath_TestNoLastName() {
         Candidate__c cand = new Candidate__c( First_Name__c = 'Testt');
         try {
             database.insert(cand);
         } catch(System.DmlException e) {
             System.assertEquals(StatusCode.CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY, e.getDmlType(0));
         }
     }
 }
 */