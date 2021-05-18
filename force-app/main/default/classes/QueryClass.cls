public with sharing class QueryClass {
    public void printCount() {
        Integer i = [SELECT Count() FROM Account];
        System.debug(i);
    }
}