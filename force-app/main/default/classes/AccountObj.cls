public with sharing class AccountObj {
    public AccountObj() {
        System.debug('Demo Class');
    }
    
    public static void showAccount() {
        LIST<Account>  listAccount = new LIST<Account>();
        
        for(Account acct:[Select Id,Name From Account]) {
            listAccount.add(acct);
        }
        system.debug(listAccount.size());
    }

    public void showMessage() {
        System.debug('Showing messages');
    }
//Dynamic DML
/*
    public void modifyAnySobject(sObject recordToUpdate, String fieldToModify, String valueToPut) {
        recordToUpdate.put(fieldToModify, valueToPut);
        update recordToUpdate;
    }

    Contact con = new Contact(LastName = 'ContactLastName');
    insert con;
    modifyAnySobject(con, 'LastName', 'Benioff');

    // upserting
    modifyAnySobject(new Account(), 'Name', Salesforce.com);
*/
}

/**
 //for batchable class use interface
 Database.Batchable

 //To execute the batch code
 Database.executeBatch

 //  Database.Batchable interface has these methods
 // creates a QueryLocator that describes the records to be processed
 start();
 return Database.QueryLocator([SELECT Id FROM Account]);
 //
 execute();
 finish();

 //Implement the schedulable interface for the class

global class scheduledBatchable implements  Schedulable {
    global void execute(SchedulableContext sc) {
        batchable b = new batchable();
        database.executeBatch(b);
    }
}

scheduledBatchable positionBatch_Feb_13_run = new scheduledBatchable();
String sch = '0 0 8 13 2 ?'; // run on february 13 8am
system.schedule('One Time Pro', sch, positionBatch_feb13);

// Monitor apex jobs
ID batchId = Database.executeBatch(reassign);
AsyncApexJob batchJobInfor = [SELECT Id, Status, JobItemProcessed, TotalJobItems, NumberOfErrors FROM AsychApexJob WHERE ID =: batchId];


private static testMethod void myTest() {
    MyBatchApex testBatch = new MyBatchApex();
    testBatch.query = 'SELECT Id FROM..'; // fetch the test rows
    Test.startTest();
    Id jobId = Database.executeBatch(testBatch);
    Test.stopTest(); // followed by System.asserts
}
 */