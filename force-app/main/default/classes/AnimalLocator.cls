public class AnimalLocator {
    public static String getAnimalNameById(Integer i) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
        request.setMethod('GET');
        HttpResponse response = http.send(request); 

        // If the request is successful, parse the JSON response
            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> animal = (Map<String,Object>) result.get('animal');
            System.debug('Name: ' + String.valueOf(animal.get('name')));
            return String.valueOf(animal.get('name'));
    }
}