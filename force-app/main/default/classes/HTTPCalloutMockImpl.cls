@isTest
global class HTTPCalloutMockImpl implements HttpCalloutMock {
    global HTTPResponse respond(HttpRequest req) {
     // Create a fake response
     HttpResponse response = new HttpResponse();
     // Set mock values for response
     response.setHeader('Content-Type', 'text/plain');
     response.setBody('Hello world');

     // Return the response containing mock values
     return response;
    }
}

/**
 Test.setMock(HTTPCalloutMock.class, new HTTPCalloutMockImpl());
 */

 /**
    //Create a StaticResourceCalloutMock to create a mock response using the data in static resource 'mockResoponse'
    StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
    mock.setStaticResource('mockResponse');
    mock.setStatusCode(200);
    mock.setHeader('Content-Type', 'plain/text');

    // Set the mock callout mode
    Test.setMock(HttpCalloutMock.class, mock);
 */


 /**
  * Asynchronous Example
   @Future (callout = true)
   public static void validateAddress(String Id) {
       Candidate__c cand = new Candidate__c(Id = Id);
    // Construct an Http request
    HttpRequest req = new HttpRequest();
    ...
   }
  */