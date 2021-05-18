public without sharing class LeadProcessor implements Database.Batchable<sObject> {
    // public Integer recordCount = 0;

    public Database.QueryLocator start(Database.BatchableContext dbc) {
        return Database.getQueryLocator([SELECT id, Name FROM Lead]);
    }

    public void execute(Database.BatchableContext dbc, List<Lead> leads) {
        for(Lead l: leads) {
            l.LeadSource = 'Dreamforce';
        }
        update leads;
        // recordCount = recordCount + leads.size();
    }

    public void finish(Database.BatchableContext dbc) {
        // System.debug('Total records processed ' + recordCount);
    }
}