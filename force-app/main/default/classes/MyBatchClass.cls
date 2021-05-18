public class MyBatchClass implements Database.Batchable<SObject> {
    // Database.QueryLocator | Iterator<sObject>
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // Collect the batch of records or objects to be passed to execute
    }

    public void execute(Database.BatchableContext bc, List<P> records) {
        // Process each batch of records
    }

    public void finish(Database.BatchableContext bc) {
        // execute any post processing operation
    }
}

// To invoke the batch class
/**
    MyBatchClass myBatchObject = new MyBatchClass();
    Id batchId = Database.executeBatch(myBatchObject); | Database.executeBatch(myBatchObject, 100);
    AsyncApexJob job = [SELECT Id, Status, JobItemsProcessed, TotalJobItems, NumberOfErrors FROM AsyncApexJob WHERE ID = :batchId];
 */