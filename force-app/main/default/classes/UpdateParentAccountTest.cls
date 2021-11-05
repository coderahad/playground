@isTest
public class UpdateParentAccountTest {
    @TestSetup
    static void setup(){
        List<Account> accounts = new List<Account>();
        // add a parent account
        accounts.add(new Account(Name='Parent'));
        // add 100 child
        for(Integer i=0; i < 100; i++) {
            accounts.add(new Account(Name='Test update Account ' + i));
        }
        insert accounts;
    }

    static testMethod void testQueueable() {
        // query for test data to pass to queueable class
        Id parentId = [select id from account where name= 'Parent'][0].id;

        List<Account> accounts = [select id, name from account where name like 'Test update Account%'];
        // create our queueable instance
        UpdateParentAccount updater = new UpdateParentAccount(accounts, parentId);
        
        // start/ stop block to force async process to run

        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();

        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(100, [select count() from account where parentId =:parentId]);
    }
}
