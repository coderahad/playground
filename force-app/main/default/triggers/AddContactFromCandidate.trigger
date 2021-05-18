trigger AddContactFromCandidate on Candidate__c (after insert) {
  List<Contact> newContacts = new List<Contact>();

  for(Candidate__c cand:Trigger.new) {
    Contact newContact = new Contact(
      LastName = cand.Name,
      MailingCity = cand.City__c
    );
    newContacts.add(newContact);
  }

  Database.insert(newContacts);
}