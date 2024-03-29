@isTest
private class AccountProcessorTest {
    @isTest
    private static void countContactsTest() {
        // Load Data
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i<300; i++) {
            accounts.add(new Account(Name = 'Test Account' + i));
        }
        insert accounts;
        
        System.debug('accounts.size() : ' + accounts.size());
      
        List<Contact> contacts = new List<Contact>();
        Set<id> accountIds = new Set<id>();

        for(Account acc:accounts) {
            contacts.add(new Contact(FirstName= acc.Name, LastName= 'TestContact', AccountId= acc.Id ));
            accountIds.add(acc.Id);
        }
        insert contacts;
        // Do the test
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        // Check result

        List<Account> accs = [SELECT Id, Number_Of_Contacts__c FROM Account];
        for(Account acc:accs) {
            System.assertEquals(1, acc.Number_Of_Contacts__c, 'ERROR:at least 1 account record with incorrect Contacts');
        }
    }
}