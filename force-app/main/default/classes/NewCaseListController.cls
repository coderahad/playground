public class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> caseList = [SELECT Id,CaseNumber FROM Case WHERE status='New'];
        return caseList;
    }
}
