@isTest
private class LeadProcessorTest {
    @isTest
    private static void testBatchClass() {
        //load test data
        List<Lead> leads = new List<Lead>();

        for(integer i=0; i<200; i++) {
            leads.add(new Lead(LastName='Hossain', Company='Salesforce'));
        }
        insert leads;

        //perform the test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();

        //Check the result
        List<Lead> updatedLeads = [SELECT id FROM Lead WHERE LeadSource='Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'ERROR: at least 1 lead record not updated correctly');
    }
}