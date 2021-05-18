trigger AccountToContactChange on Account (after update) {
    ChangeContactsAddressFromAccount triggerStart = new ChangeContactsAddressFromAccount();
    if(Trigger.isAfter && Trigger.isUpdate) {
      triggerStart.isAfterUpdate(Trigger.new);
    }
  }

  /**
   * 
   if(Trigger.isBefore) {
       for(Account acc : Trigger.new)  {
           if(acc.UpsellOpportunity__c == 'Yes' && acc.Rating == 'Cold') {
               acc.addError('Account cannot be cold with upsell opportunity');
           }
       } 
   }
   */
    
  /*  
  if(Trigger.isAfter) {
      System.debug('Inside AccountToContactChange trigger: Trigger.isAfter ');
  }

  if(Trigger.isBefore) {
      System.debug('Inside AccountToContactChange trigger: Trigger.isBefore ');      
      
  }
  */
  
  
  
  /*
  List<Contact> listContacts = new List<Contact>();
  for(Account c:Trigger.new) {
    Contact updatedContact = new Contact();
    if(c.BillingCity != Trigger.oldMap.get(c.id).BillingCity) {
      updatedContact.MailingCity = c.BillingCity;
    } else if (c.ShippingCity != Trigger.oldMap.get(c.id).ShippingCity) {
       updatedContact.OtherCity = c.ShippingCity;
    }
    listContacts.add(updatedContact);
  }
  update(listContacts);
  */