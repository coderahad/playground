global class THSomeClass {
    public static void someFutureMethod(List<Id> recordIds) {
        List<Account> accounts = [Select Id, Name from Account Where Id IN :recordIds];
        // process account records
    }
}
