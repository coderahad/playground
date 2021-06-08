Account a = new Account();
a.Name = 'Hossain Corp';

insert a;

Account b = new Account();
b.name = 'Acrylic';

Account c = new Account(name = 'Berzer');
Account d = new Account(Id = '0015g000006lhREAAY');
d.BillingCity = 'New York';
update d;
System.debug(d);
System.debug(c);
System.debug(b);

sObject s = new Account(Id = '0015g000006lhREAAY');
s.put('Name', 'Hossain\'s Corp');
Object fieldValue = s.get('Name');

System.debug(fieldValue);


Sobject s = new Account();
Account e = (Account) s;

Sobject[] ss = new Account[0];
List<Account> aa = (List<Account>) ss;

Database.insert(ss);
// System.debug(e);
// System.debug(aa);

List<String> eList = new List<String>();

eList.add('youi@gg.com');
eList.add('jfjj@pp.com');
eList.add('ajfdj@oo.com');
eList.add('teasd@ll.com');
eList.add('youi@gg.com');

Integer eListSize;
eListSize = eList.size();
System.debug(eListSize);
System.debug(eList.get(4));
eList.set(3,'meii@nn.com');
System.debug(eList.get(3));

String[] emailList = new String[5];

emailList[0] = 'youi@gg.com';
emailList[1] = 'jfjj@pp.com';
emailList[2] = 'ajfdj@oo.com';
emailList[3] = 'teasd@ll.com';
emailList[4] = 'youi@gg.com';

Integer emailListSize;
emailListSize = emailList.size();

System.debug(emailListSize);
System.debug(emailList.get(4));
emailList.set(4,'meii@nn.com');
System.debug(emailList.get(4));

Set<Integer> intSet = new Set<Integer>();

intSet.add(41);
intSet.add(42);
intSet.add(43);
intSet.add(45);

Integer intSetSize;

intSetSize = intSet.size();

System.debug(intSetSize);
System.debug(intSet.contains(43));

intSet.remove(43);
System.debug(intSet.contains(43));

Map<String, String> keyMap = new Map<String, String>();

keyMap.put('white', 'house');
keyMap.put('purple', 'garage');
keyMap.put('blue', 'trunk');
keyMap.put('green', '');
keyMap.put('Violet', 'Terrace');

System.debug(keyMap.get('blue'));
System.debug(keyMap.containsKey('green'));

for(Integer i = 0; i < 10; i++) {
  System.debug(i+1);
}

String[] seasons = new String[] {'winter', 'summer', 'fall', 'spring'};

for(String season: seasons) {
  System.debug(season);
}

new VRectangle().describeQuad();


QueryClass qc = new QueryClass();

qc.printCount();


List<Account> cities = [SELECT Name FROM Account WHERE BillingCity = 'New York'];

System.debug(cities);

Account city = [SELECT Name FROM Account WHERE Id = '0015g000006lhREAAY'];

System.debug(city);

Integer i = [SELECT Count() FROM Account WHERE BillingCity = 'New York'];

System.debug(i);

String billcity = 'New York';
List<Account> billcities;

billcities =  [SELECT Name FROM Account WHERE BillingCity = :billcity];

System.debug(billcities);


List<Account> billcitiess;

billcitiess =  [SELECT Name FROM Account WHERE BillingCity = :('New' + ' York')];

System.debug(billcitiess);

//SIngle Variable
// Use this format if not executing DML statement within the for loop

For(Account a: [SELECT Name FROM Account WHERE BillingCity = 'New York']) {
  // Code without DML statement
}

// Variable list
// Use this format for efficiency if executing DML statements within the for loop

For(List<Account> accts: [SELECT Name FROM Account WHERE BillingCity = 'New York']) {
  For(Account acct : accts) {
    // code without DML statement
  }
  update accts;
}

System.debug('Number of queries remaining ' + Limits.getQueries());
System.debug('Number of queries remaining ' + Limits.getLimitQueries());

System.debug('___Name       :' + UserInfo.getName());
System.debug('___ORG        :' + UserInfo.getOrganizationName());
System.debug('___ProfileID  :' + UserInfo.getProfileId());
System.debug('___UserID     :' + UserInfo.getUserId());
System.debug('___UserType   :' + UserInfo.getUserType());


myDivision p = new myDivision();
p.myDivision(null, 0);

// When two method in the class is static
myDivision.myDivision(null, 0);


// DYNAMIC APEX

/////
// generate a Map of all sObjects names(keys) to sObjects tokens(values) 
Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();

// declare a name to hold the name of arbitrary sObject
String objName = 'Account';

// get the Schema.DescribeSObjectResult of the objName arbitrary sObject
Schema.DescribeSObjectResult arbDSR = schemaMap.get(objName).getDescribe();

// generate a Map of all field names(keys) to field tokens(values)
Map<String, Schema.SObjectField> fieldMap = arbDSR.fields.getMap();

// declare a name to hold the name of an arbitrary picklist field
String fieldName = 'Industry';

//get the Schema.DescribeFieldResult of the fieldName arbitrary field
Schema.DescribeFieldResult arbDFR = fieldMap.get(fieldName).getDescribe();

// get the Schema.PickListEntry list from the DescribeFieldResult
List<Schema.PickListEntry> picks = arbDFR.getPicklistValues();

// system log the label and value of the first picklistentry in the list
System.debug(picks[0].getLabel() + ', ' + picks[0].getValue());

/////
// Obtain the token for any sObject
Account a1 = new Account();
Schema.sObjectType tokenA = a1.getSObjectType();

// Instantiate a new sobject from the token
sObject  s = tokenA.newSObject();
Account a2 = (Account) s;

// SOQL creation on the fly
sObject S = Database.query(string_limit_1);
List<sObject> L = Database.query(string);

String.escapeSingleQuotes(string);

// SOSL creation on the fly
List<List<sObject>> myQuery = search.query(SOSL_search_string);
String.escapeSingleQuotes(string);



//////////// TRAILHEAD APEX BASICS & DATABASE \\\\\\\\\\
//The following two declarations are equivalent

List<String> colors = new List<String>();

String[] colors = new List<String>();

// Create a list and add elements to it in one step
List<String> colors = new List<String> { 'red', 'green', 'blue' };
// Add elements to a list after it has been created
List<String> moreColors = new List<String>();
moreColors.add('orange');
moreColors.add('purple');

// Get elements from a list
String color1 = moreColors.get(0);
String color2 = moreColors[0];
System.assertEquals(color1, color2);

for(Integer i=0;i<colors.size();i++) {
    // Write value to the debug log
    System.debug(colors[i]);
}
// testing array of account sObject instead of listing

Account acc = new Account(name='A');
Account acc1 = new Account(name='B', Phone='123456');
Account[] accs = new Account[]{acc, acc1};
// or
List<Account> accs = new List<Account>{acc, acc1};
System.debug(accs);

// run THEmailManager class
THEmailManager em = new THEMailManager();
em.sendMail('hossainforcontact@gmail.com', 'trailhead message', '123 body');
// run THEmailManager class with static sendMail() method
THEmailManager.sendMail('hossainforcontact@gmail.com', 'trailhead message', '456 body');

// TH challenge
System.debug(StringArrayTest.generateStringArray(10));

// TH Manipulate records with DML example
// Create a list of contacts
List<Contact> conList = new List<Contact> {
    new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
        new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
        new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
        new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
            
// Bulk insert all contacts with one DML call
insert conList;
// List to hold the new contacts to update
List<Contact> listToUpdate = new List<Contact>();
// Iterate through the list and add a title only
//   if the department is Finance
for(Contact con : conList) {
    if (con.Department == 'Finance') {
        con.Title = 'Financial analyst';
        // Add updated contact sObject to the list.
        listToUpdate.add(con);
    }
}
// Bulk update all contacts with one DML call
update listToUpdate;


// Upsert example

// Insert the Josh contact
Contact josh = new Contact(FirstName='Josh',LastName='Kaplan',Department='Finance');       
insert josh;
// Josh's record has been inserted
//   so the variable josh has now an ID
//   which will be used to match the records by upsert
josh.Description = 'Josh\'s record has been updated by the upsert operation.';
// Create the Kathy contact, but don't persist it in the database
Contact kathy = new Contact(FirstName='Kathy',LastName='Brown',Department='Technology');
// List to hold the new contacts to upsert
List<Contact> contacts = new List<Contact> { josh, kathy };
// Call upsert
upsert contacts;
// Result: Josh is updated and Kathy is created.

// Upserting to update specific field
Contact jane = new Contact(FirstName='Jane',
                         LastName='Smith',
                         Email='jane.smith@example.com',
                         Description='Contact of the day');
insert jane;
// 1. Upsert using an idLookup field
// Create a second sObject variable.
// This variable doesn’t have any ID set.
Contact jane2 = new Contact(FirstName='Jane',
                         LastName='Smith',  
                         Email='jane.smith@example.com',
                         Description='Prefers to be contacted by email.');
// Upsert the contact by using the idLookup field for matching.
upsert jane2 Contact.fields.Email;
// Verify that the contact has been updated
System.assertEquals('Prefers to be contacted by email.',
                   [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);

// delete(bulk) 
Contact[] contactsDel = [SELECT Id FROM Contact WHERE LastName='Smith']; 
delete contactsDel;

// Handling the DmlException type exceptions
try {
    // This causes an exception because 
    //   the required Name field is not provided.
    Account acct = new Account();
    // Insert the account 
    insert acct;
} catch (DmlException e) {
    System.debug('A DML exception has occurred: ' +
                e.getMessage());
}

//Database Methods
// This is how you call the insert method with the allOrNone set to false.
Database.insert(recordList, false);
// insert and update operations each return an array of Database.SaveResult objects.
Database.SaveResult[] results = Database.insert(recordList, false);
//Upsert returns Database.UpsertResult objects, and delete returns Database.DeleteResult objects.

//Inserting Records with Partial Success
// Create a list of contacts
List<Contact> conList = new List<Contact> {
        new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
        new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
        new Contact(FirstName='Caroline',LastName='Portsenko',Department='Finance'),
        new Contact()};
            
// Bulk insert all contacts with one DML call
Database.SaveResult[] srList = Database.insert(conList, false);
// Iterate through each returned result
for (Database.SaveResult sr : srList) {
    if (sr.isSuccess()) {
        // Operation was successful, so get the ID of the record that was processed
        System.debug('Successfully inserted contact. Contact ID: ' + sr.getId());
    } else {
        // Operation failed, so get all errors
        for(Database.Error err : sr.getErrors()) {
            System.debug('The following error has occurred.');
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Contact fields that affected this error: ' + err.getFields());
	 }
    }
}

//inserting related records
Account acct = new Account(Name='SFDC Account');
insert acct;
// Once the account is inserted, the sObject will be 
// populated with an ID.
// Get this ID.
ID acctID = acct.ID;
// Add a contact to this account.
Contact mario = new Contact(
    FirstName='Mario',
    LastName='Ruiz',
    Phone='415.555.1212',
    AccountId=acctID);
insert mario;

// Updating related records
// Query for the contact, which has been associated with an account.
Contact queriedContact = [SELECT Account.Name 
                          FROM Contact 
                          WHERE FirstName = 'Mario' AND LastName='Ruiz'
                          LIMIT 1];
// Update the contact's phone number
queriedContact.Phone = '(415)555-1213';
// Update the related account industry
queriedContact.Account.Industry = 'Technology';
// Make two separate calls 
// 1. This call is to update the contact's phone.
update queriedContact;
// 2. This call is to update the related account's Industry field.
update queriedContact.Account; 

// deleting related records
Account[] queriedAccounts = [SELECT Id FROM Account WHERE Name='SFDC Account'];
delete queriedAccounts;

// SOQL queries
//get the child records from the SOQL result by using the Contacts relationship name on the sObject.
Account[] acctsWithContacts = [SELECT Name, (SELECT FirstName,LastName FROM Contacts)
                               FROM Account 
                               WHERE Name = 'SFDC Computing'];
// Get child records
Contact[] cts = acctsWithContacts[0].Contacts;
System.debug('Name of first associated contact: ' 
             + cts[0].FirstName + ', ' + cts[0].LastName);
//It can Also be the single
Contact cts = acctsWithContacts[0].Contacts;
System.debug('Name of first associated contact: ' 
             + cts.FirstName + ', ' + cts.LastName);

// Contacts associated account by traversing the relationship between accounts and contacts.
//get parent records
Contact[] cts = [SELECT Account.Name FROM Contact 
                 WHERE FirstName = 'Carol' AND LastName='Ruiz'];
Contact carol = cts[0];
String acctName = carol.Account.Name;
System.debug('Carol\'s account name is ' + acctName);

// perform DML using for loop sObject list format which helps avoid governor limits.
// and the use of '_' in SOQL
insert new Account[]{new Account(Name = 'for loop 1'), 
                     new Account(Name = 'for loop 2'), 
                     new Account(Name = 'for loop 3')};
// The sObject list format executes the for loop once per returned batch
// of records
Integer i=0;
Integer j=0;
for (Account[] tmp : [SELECT Id FROM Account WHERE Name LIKE 'for loop _']) {
    j = tmp.size();
    i++;
}

System.assertEquals(3, j); // The list should have contained the three accounts
                       // named 'yyy'
System.assertEquals(1, i); // Since a single batch can hold up to 200 records and,
                       // only three records should have been returned, the 
                       // loop should have executed only once
System.debug(j);
System.debug(i);


ContactSearch.SearchForContacts('Rogers', '27215');

//SOSL
List<List<sObject>> searchList = [FIND 'Wingo OR SFDC' IN ALL FIELDS 
                   RETURNING Account(Name),Contact(FirstName,LastName,Department)];
Account[] searchAccounts = (Account[])searchList[0];
Contact[] searchContacts = (Contact[])searchList[1];
System.debug('Found the following accounts.');
for (Account a : searchAccounts) {
    System.debug(a.Name);
}
System.debug('Found the following contacts.');
for (Contact c : searchContacts) {
    System.debug(c.LastName + ', ' + c.FirstName);
}

ContactAndLeadSearch.searchContactsAndLeads('Smith');