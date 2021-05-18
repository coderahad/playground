@RestResource (urlMapping = '/contact/v1/*')
global class MyRestService {
    @HttpPost
    global static Id doPost (String cLastName, Account a) {
        Contact c = new Contact(lastName = cLastName, AccountId = a.Id);
        insert c;
        return c.id;
    }
}
/**
  RestRequest req = RestContext.request;
  RestRespose res = RestContext.respose;

  |Salesforce server             |Apex REST service| Resource 
  https://instance.salesforce.com/services/apexrest/resourcename

  https://ap8.salesforce.com/services/apexrest/contact/v1/

  XMLStramWriter, XMLStreamReader, Document, XMLNode
  JSON, JSONGenerator, JSONParser
 */