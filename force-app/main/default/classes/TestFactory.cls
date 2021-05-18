@isTest
public class TestFactory {
    public static Candidate__c buildTestCandidates(Integer i) {
        Candidate__c testCandidate = new Candidate__c();
        String counter = String.valueOf(i);
        testCandidate.Name = 'TestCan' + counter;
        testCandidate.City__c = 'TestCity' + counter;
        return testCandidate;
    }
}