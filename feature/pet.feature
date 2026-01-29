Feature: List Pets API validation 
Background: Configure Pets API base request
    * url petUrl

Scenario: Verify pets list by status is returned and not empty
    * path 'v2/pet/findByStatus'
    * param status = 'available'
    * method get
    * status 200
    * match response != null
    * match response == '#[]'
    * assert response.length > 0
    * print 'Total pets with available status:', response.length
    * match each response contains
    """
        {
        "id": "#number",
        "name": "#string",
        "photoUrls": "#[]",
        "tags": "#[]",
        "status": "#string"
    }
    """
   
    