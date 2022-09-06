@isTest
private class AddPrimaryContactTest {
    @isTest
    private static void testQueueable() {
        // load test data
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 500; i++) {
            Account acc = new Account(name='Test Account');
            if( i < 250) {
                acc.billingState = 'NY';
            } else {
                acc.billingState = 'CA';
            }
            accounts.add(acc);
        }
        insert accounts;

        Contact contact = new Contact(FirstName='Simon', LastName='Connock');
        // Perform the test
        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        //Check the result
        List<Contact> contacts = [select Id from contact where Contact.Account.BillingState = 'CA'];
        System.assertEquals(200, contacts.size(), 'ERROR: Incorrect number of Contact records found');
    }
}