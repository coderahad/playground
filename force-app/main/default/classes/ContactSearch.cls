public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postalCode) {
        List<Contact> cont = [SELECT Id,Name FROM Contact WHERE LastName=:lastName AND MailingPostalCode=:postalCode];
        System.debug(cont);
        return cont;
    }
}