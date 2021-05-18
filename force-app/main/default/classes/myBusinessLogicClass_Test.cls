@isTest
// Naming convention is class name ends with _Test
private class myBusinessLogicClass_Test {
    static void helperMethod1(){}
    // method that are unit tests need to be annotated properly
    static @isTest void myBusinessLogicTest1(){}
    static testMethod void myBusinessLogicTest2(){}

    static testMethod void myTest() {
        /*
        Candidate__c myTestData = new Candidate__c();
        insert myTestData;
        ...
        update myTestData;
        ..
        myResults = [SELECT ... FROM Candidate__c WHERE ...];
        System.assert(...);
        Integer x = 0;
        Integer y = 0;
        System.assert(x == y);
        System.assertEquals(x, y);
        System.assertNotEquals(x, y);
        */
    }
}

/*
public class myBusinessLogicClass {
    static testMethod void myBusinessLogicTest() {
        // code to test business logic
    }
}
*/

/**
 
 public class myBusinessLogicClass {
     @isTest
     private testMethod void myBusinessLogicTest() {
         //code to test business logic
     }
  }

 */