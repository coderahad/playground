public class RecordUtility {
	
    /**
     *  Create a sample Account to test trigger
     */
    public static void createAccount() {
        Account acc = new Account();
        
        acc.Name = 'Test Account from Anon 2';
        acc.UpsellOpportunity__c = 'Yes'; 
        acc.Rating = 'Cold';
        
        insert acc;        
    }
    
    /**
     * Create mass Candidates for test 
     */ 
    public static void createMassCandidate(Integer numberOfRec) {
    	List<Candidate__c> listCandidate = new List<Candidate__c>();
        
        
        //Integer count = 0;
        for(Integer count = 1; count <= numberOfRec; count++) {
        	Candidate__c candidate = new Candidate__c();
            
            candidate.Name = 'Test Name ' + count;
            
            listCandidate.add(candidate);
        }
        
        insert listCandidate;
    }
    
}