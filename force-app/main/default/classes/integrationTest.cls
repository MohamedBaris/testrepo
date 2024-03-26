public class integrationTest {

    public static void function(){   
    // Instantiate a new HTTP request object
HttpRequest req = new HttpRequest();
        try{
req.setEndpoint('https://www.google.com');
req.setMethod('GET');
        }
        catch(exception e){
            system.debug(e);
        }
// Send the HTTP request and get the response
Http http = new Http();
HttpResponse res = http.send(req);

// Check the response status code
if (res.getStatusCode() == 200) {
    // Process the response body
    String responseBody = res.getBody();
    // ...
}


}
}