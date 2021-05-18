public class HTTPCalloutSample {
    //Pass in the endpoint to be used using the string url
    public String getContent(String url) {
     //Instantialte a new http object
     Http h = new Http();

     // Instantiate a new HTTP request, specify the method(Get) as well as the endpoint.
     HttpRequest req = new HttpRequest();
     req.setEndpoint(url);
     req.setMethod('GET');

    // Send the request and return a response
     HttpResponse res = h.send(req);
     return res.getBody();
    }
}