global class InboundEmailHandler implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        return result;
    }
}
/*
List<Attachment> attachments = List<Attachment>();
for(Messaging.InboundEmail.BinaryAttachment binaryAtt:email.binaryAttachments) {
    Attachment attachment = new Attachment();
    attachment.parentId = candidate.id; // any top level id
    attachment.body = binaryAtt.body;
    attachment.name = binaryAtt.fileName;
    attachments.add(attachment);
}

for(Messaging.InboundEmail.TextAttachment textAtt:email.textAttachments) {
    Attachment attachment = new Attachment();
    attachment.parentId = candidate.id;
    attachement.body = Blob.valueOf(textAtt.body);
    attachment.name = textAtt.fileName;
    attachments.add(attachment);
}

insert attachments;
*/

/**
  try {
      // try some action which may cause an exception or an error, eg DML statements
  } catch(Exception e) {
      Error_log__c log = new Error_log__c();
      log.trace__c = e.getTypeName() + '\n' + e.getCause() + '\n' + e.getMessage(); 
      insert log;

      result.success = false; // result is a Messaging.InboundEmailResult
      result.message = e.getTypeName() + '\n' + e.getCause() + '\n' + e.getMessage(); 
      return result;
  }
 */

 // OUTBOUND EMIAL HANDLER
 /**
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    email.setSubject = 'Hello World';
    email.setHtmlBody('<html><body><h1>Hello World!</h1></body></html>');
    String[] emailAddresses = new String[] {'name@domail.com'};
    email.setToAddresses(emailAddresses); // set recipient
    Messaging.SendEmailResult[] mailResults = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    for (Messaging.SendEmailResult mailResult:mailResults) {
        if(!mailResult.isSuccess()) {
            // do error processing
        }
    }
  */