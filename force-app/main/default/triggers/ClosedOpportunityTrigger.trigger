trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
  List<Task> tasks = new List<Task>();

  for(Opportunity opp: [SELECT Id FROM Opportunity WHERE Id IN :Trigger.new AND StageName='Closed Won']){
    tasks.add(new Task(Subject='Follow Up Test Task', WhatId= opp.id));
  }
  if (tasks.size() > 0) {
    insert tasks;
}
}