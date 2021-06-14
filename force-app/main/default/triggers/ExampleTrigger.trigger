trigger ExampleTrigger on Contact (after insert, after delete) {
  if(Trigger.isInsert) {
    Integer recordCount = Trigger.new.size();
    // Call Utility method from another Class

    THEmailManager.sendMail('hossainforcontact@gmail.com', 'Trailhead Trigger Tutorial', recordCount + 
    'Contacts were created');
  } else if (Trigger.isDelete) {
    // Process after delete
  }
}