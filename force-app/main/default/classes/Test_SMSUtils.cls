@isTest
private class Test_SMSUtils {
    private static void testSendSms() {
        Test.setMock(HttpCalloutMock.class, new SMSCalloutmock());
        Test.startTest();
            SMSUtils.sendSMSAsync(111, 222, 'Greetings');
        Test.stopTest();
        // runs callout and check results
        List<SMS_Log__c> logs = [SELECT Msg__c FROM SMS_Log__c];
        System.assertEquals(1, logs.size());
        System.assertEquals('success', log[0].Msg__c);
    }
}
