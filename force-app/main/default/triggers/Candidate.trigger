trigger Candidate on Candidate__c (before insert) {
	
    for(Candidate__c candidate : Trigger.new) {
        candidate.City__c = 'Dhaka';
    }
    
    System.debug('Trigger Size : ' +  Trigger.new.size());
}