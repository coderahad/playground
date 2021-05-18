@isTest
private class UpdateContactAddressesTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        // insert 10 accounts
        for(Integer i=0; i<10; i++) {
            accounts.add(new Account(Name='Account ' + i, BillingCity='New York', BillingCountry='USA'));
        }
        insert accounts;

         // find the account just inserted. add contact for each
         for(Account account: [SELECT id FROM Account]) {
             contacts.add(new Contact(FirstName='first', LastName='last', AccountId=account.id));
         }
        insert contacts;
    }
    @isTest static void test() {
        Test.startTest();
        UpdateContactAddresses uca = new UpdateContactAddresses();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [SELECT count() FROM Contact WHERE MailingCity='New York']);
    }
}