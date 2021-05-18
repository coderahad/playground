public with sharing class ChangeContactsAddressFromAccount {
    public void isAfterUpdate(List<Account> accList) {
        updateAddressToContacts(accList);
        // System.debug(accList);
    }

    public void updateAddressToContacts(List<Account> accList) {
        Map<Id,Account> mapOfIdToAccount = new Map<Id,Account>();
        List<Contact> lstOfUpdatedContacts = new List<Contact>();
        // Maping Account Ids that are updated
        for(Account acc:accList) {
            mapOfIdToAccount.put(acc.id, acc);
        }
        
        List<Contact> contactList = [SELECT MailingCity, MailingStreet, MailingCountry, MailingPostalCode, MailingState, OtherCity, OtherCountry, OtherStreet, OtherPostalCode, OtherState, AccountId From Contact WHERE AccountId IN :accList];

        Account newAccount;
        for(Contact con:contactList) {
            newAccount = mapOfIdToAccount.get(con.AccountId);
            con.MailingCity = newAccount.BillingCity;
            con.MailingCountry = newAccount.BillingCountry;
            con.MailingPostalCode = newAccount.BillingPostalCode;
            con.MailingStreet = newAccount.BillingStreet;
            con.MailingState = newAccount.BillingState;
            con.OtherCity = newAccount.ShippingCity;
            con.OtherCountry = newAccount.ShippingCountry;
            con.OtherPostalCode = newAccount.ShippingPostalCode;
            con.OtherStreet = newAccount.ShippingStreet;
            con.OtherState = newAccount.ShippingState;
            lstOfUpdatedContacts.add(con);
        }
        if(!lstOfUpdatedContacts.isEmpty()) {
            update lstOfUpdatedContacts;
        }
    }

}