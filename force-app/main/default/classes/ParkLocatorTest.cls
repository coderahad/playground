@isTest
private class ParkLocatorTest {
    @isTest
    static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String con = 'Bangladesh';
        List<String> parks = ParkLocator.country(con);
        System.assertEquals(2, parks.size());
    }
}
