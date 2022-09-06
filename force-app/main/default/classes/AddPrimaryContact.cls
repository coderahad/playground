public class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact inputContact, String inputState) {
        this.contact = inputContact;
        this.state = inputState;
    }

    public void execute(QueueableContext context) {
    // retrieve 200 accounts
    List<Account> accounts = [Select Id from Account where billingstate=:state limit 200];
        
    // create empty list of contact records
    List<Contact> contacts = new List<Contact>();

    // iterate through the Account records
    for( Account acc: accounts) {
        // Clone (copy) the contact record, make the clone a child of the specific Account record
        // and add to the list of contacts
        Contact contactClone = contact.clone();
        contactClone.AccountId = acc.Id;
        contacts.add(contactClone);
      }
      insert contacts;
    }
}