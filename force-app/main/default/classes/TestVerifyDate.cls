@isTest
private class TestVerifyDate {
   @isTest static void testVerify() {
       Date day = Date.today();
       Date dayInRange = Date.today().addDays(20);
       Date dayAfter = Date.today().addDays(40);
       Date dayBefore = Date.newInstance(2021, 06, 28);

        Date dateBefore = VerifyDate.CheckDates(day, dayBefore);
        System.assertEquals(Date.newInstance(2021, 06, 30), dateBefore);

        Date dateInRange = VerifyDate.CheckDates(day, dayInRange);
        System.assertEquals(dayInRange, dateInRange);

        Date dateAfter = VerifyDate.CheckDates(day, dayAfter);
        System.assertEquals(Date.newInstance(2021, 06, 30), dateAfter);
   } 
}
