public  class SMSUtils {
    // Call async from triggers, etc where callouts not permitted
    @future(callout=true)
    public static void sendSMSAsync(Integer fromNbr, Integer ToNbr, String m) {
        String results = sendSMS(fromNbr, ToNbr, m);
        System.debug(results);
    }

//The SmsMessage class and SMS_Log__c sObject in the example are hypothetical 
//and shown only to demonstrate the callout pattern.
    // Call from controller, etc, for immediate processing
    public static String sendSMS(Integer fromNbr, Integer ToNbr, String m) {
        // Calling 'send' will result in a callout
        String results = SmsMessage.send(fromNbr, ToNbr, m);
        insert new SMS_Log__c(To__c=ToNbr, From__c=fromNbr, Msg__c=results);
        return results;
    }
}
