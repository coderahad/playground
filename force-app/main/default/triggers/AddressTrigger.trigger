trigger AddressTrigger on Account (before insert, before update) {
  for(Account acc: Trigger.new) {
    // code block
  }
}
/**
trigger UpdateDescriptionAfterDiactivation on Job_Posting_Site__c (before update) {
  for(Job_Posting_Site__c site: Trigger.new) {
    if(site.status__c != Trigger.oldMap.get(id).status__c) && (site.status__c == 'Inactive') {
      String changeDate =  String.valueOf(Date.Today());
      site.Description__c = 'As of ' + chageDate + ' this site is no longer Active ' + site.Description__c;
    }
  }
}
*/

/**
trigger myAccountTrigger on Account (before delete, before insert, before update, after delete, after insert
, after update, after undelete) {
  if(Trigger.isBefore && Trigger.isDelete) {
   // Helper method 1, Helper method 2 etc.
  }
  if(Trigger.isBefore && Trigger.isUpdate) {
    // Helper method 3, Helper method 4 etc.
  }
  ...all seven DML conditions.
}

// Bulkify
trigger AddAccount on Candidate__c(after insert) {
  List<Contact> newContacts = new List<Contact>();
  for(Candidate__c c: Trigger.new) {
    Contact newContact = new Contact(LastName = c.Last_Name__c, FirstName = c.First_Name__c, Email = c.Email__c);
    newContacts.add(newContact);
  }
  database.insert(newContacts);
}

trigger leadDuplicatePreventer on Lead (before insert, before update) {
  Map<String, Lead>  leadMap = new Map<String, Lead>();

  for(Lead lead:System.Trigger.new) {
    if (
      (lead.Email != null) && (System.Trigger.isInsert || (lead.Email != System.Trigger.oldMap.get(lead.id).Email))
      ) {
        if(leadMap.containsKey(lead.Email)) {
          lead.Email.addError('Duplicate Email!');
        } else {
          leadMap.put(lead.Email, lead);
        }
    }
  }
    for (Lead lead: [SELECT Email From Lead WHERE Email IN : leadMap.keySet()]) {
      Lead newLead = leadMap.get(lead.Email);
      newLead.Email.addError('Duplicate Email');
    }
}


public with sharing class EndTheRecursiveTrigger {
  public static boolean endTheTriggerCallStack = false;
}

trigger BuildReciprocalRelationship on Thesaurus__c (after insert) {
  if (EndTheRecursiveTrigger.endTheTriggerCallStack == false) {
    for (Thesaurus__c r: Trigger.new) {
      Thesaurus__c reverseRelationship = new Thesaurus__c();
      reverseRelationship.Search_Term__c = r.Related_Word__c;
      reverseRelationship.Related_Word__c = r.Search_Term__c;
      reverseRelationship.Relationship_Type__c = r.Relationship_Type__c;
      EndTheRecursiveTrigger.endTheTriggerCallStack = true;
      insert(ReverseRelationship);
    }
  }
}
 */