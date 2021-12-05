@isTest
public class AccountManagerTest {
    @isTest
    static void testGetAccount() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://playground-org-dev-ed.lightning.force.com/services/apexrest/Accounts/'+ recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account thisAccount = AccountManager.getAccount();
        System.assert(thisAccount != null);
        System.assertEquals(thisAccount.Contacts.size(), 5);
    }

    static Id createTestRecord() {
        Account acc = new Account(Name='Test Account');
        insert acc;
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < 5; i++) {
            Contact con = new Contact();
            con.LastName = 'Test Contact '+i;
            con.AccountId = acc.Id;
            contacts.add(con); 
        }
        insert contacts;
        return acc.Id;
    }
}
