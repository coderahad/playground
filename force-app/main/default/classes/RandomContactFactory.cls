// @isTest
public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numCon, String lstName) {
        List<Contact> conList = new List<Contact>();
        for(integer i = 0; i < numCon; i++) {
            Contact con = new Contact(FirstName='Random' + i, LastName=lstName);
            conList.add(con);
        }
        return conList;
    }
}