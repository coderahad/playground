@isTest
private class TestRestrictContactByName {
    @isTest static void RestrictContactByNameWithInvalidName() {
        // insert a contact
        Contact con = new Contact(LastName='INVALIDNAME');
        insert con;
    }
    @isTest static void RestrictContactByNameUpdate() {
        Contact cont = new Contact(LastName='Roman');
        insert cont;
        List<Contact> updConList = new List<Contact>();
        List<Contact> updCon = [SELECT Id FROM Contact WHERE LastName='Roman'];
        // updCon[0].LastName = 'INVALIDNAME';
        for(Contact c: updCon) {
            c.LastName = 'INVALIDNAME';
            updConList.add(c);
        }
        update updConList;
    }
}