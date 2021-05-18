public without sharing class AccountProcessor {
    @future
    public static void countContacts(List<id> ids) {
        List<Account> accounts = [SELECT id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :ids];
		System.debug(accounts);
        for(Account acc:accounts) {
                acc.Number_Of_Contacts__c = acc.Contacts.size();
            System.debug(acc.Number_Of_Contacts__c);
            }

         update accounts;
        }
    }