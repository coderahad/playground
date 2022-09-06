public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String name) {
        List<List<SObject>> res = [ FIND :name IN NAME FIELDS RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName, Company) ];
        Contact[] cons = (Contact[])res[0];
        Lead[] lds = (Lead[])res[1];
        System.debug('The Contacts are: ');
        for(Contact con: cons) {
            System.debug(con.FirstName+ ' '+ con.LastName);
        }
        System.debug('The Leads are: ');
        for(Lead ld: lds) {
            System.debug(ld.FirstName + ' ' + ld.LastName);
            System.debug('Company: ' + ld.Company);
        }
        return res;
    }
}