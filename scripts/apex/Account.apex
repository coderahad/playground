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
