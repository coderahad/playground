public class AccountHandler {
    public static Account insertNewAccount(String name) {
        try {
            Account acc = new Account(Name=name);
            insert acc;
            System.debug('Account inserted successfully '+ acc);
            return acc;
        } catch (DmlException e) {
            System.debug('A dmlexception occured '+ e.getMessage());
            return null;
        }
    }
}