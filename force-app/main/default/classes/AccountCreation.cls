public class AccountCreation {
    public static List<Account> creatAccount(Integer intg) {  
        List<Account>  accList = [SELECT Id, Name, BillingCity FROM Account LIMIT :intg];
        return accList;
    }
}