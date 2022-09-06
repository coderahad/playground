@isTest
private class CaseManagerTest {
    @isTest
    static void testGetCaseById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://playground-org-dev-ed.lightning.force.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Case thisCase = CaseManager.getCaseById();
        // Verify the result
        System.assert(thisCase != null);
        System.assertEquals('Test Record', thisCase.Subject);
    }
    @isTest
    static void testCreateCase() {
        // Call the method to test
        ID thisCaseId = CaseManager.createCase('Ferocious chipmunk', 'New', 'Phone', 'Low');
        // Verify the results
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Subject FROM Case WHERE Id =:thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals( thisCase.Subject, 'Ferocious chipmunk');
    }
    @isTest
    static void testDeleteCase() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://playground-org-dev-ed.lightning.force.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'DELETE';
        RestContext.request = request;
        // Call the method to test
        CaseManager.deleteCase();
        // Verify record is deleted
        List<Case> cases = [SELECT Id FROM Case WHERE Id =:recordId];
        System.assert(cases.size() == 0);
    }
    // Here we did not use createTestRecord because we need 5th parameter for recordId
    @isTest
    static void testUpsertCase(){
        ID case1Id = CaseManager.upsertCase('Ferocious chipmunk', 'New', 'Phone', 'Low', null);
        // Verify new record was created
        System.assert(case1Id!=null);
        Case case1 = [SELECT Id, Subject FROM Case WHERE Id =:case1Id];
        System.assert(case1 != null);
        System.assertEquals(case1.Subject, 'Ferocious chipmunk');
        // 2. Update status of existing record to Working
        ID case2Id = CaseManager.upsertCase('Ferocious chipmunk', 'Working', 'Phone', 'Low', case1Id);
        System.assertEquals(Case2Id, Case1Id);
        Case case2 = [SELECT Id, Subject, Status FROM Case WHERE Id =:case2Id];
        System.assert(case2 != null);
        System.assertEquals(case2.Status, 'Working');
    }
    @isTest
    static void testUpdateCaseFields() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://playground-org-dev-ed.lightning.force.com/services/apexrest/Cases/' + recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"status": "Working"}');
        RestContext.request = request;
        // Update status of existing record to Working
        ID thisCaseId = CaseManager.updateCaseFields();
         // Verify record was updated
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Subject, Status FROM Case WHERE Id =:thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Status, 'Working');
    }

    //Helper method
    static Id createTestRecord() {
        // Create test record
        Case caseTest = new Case(Subject='Test Record', Status='New', Origin='Phone', Priority='Medium');
        insert caseTest;
        return caseTest.Id;
    }
}