Feature: Cat Breeds API validation

Background: Configure Breeds API base request
    * url 'https://catfact.ninja'
    * path 'breeds'

Scenario: Verify breeds list is returned and not empty
    * method get
    * status 200
    * match response != null
    * match response.data == '#[]'
    * assert response.data.length > 0
    * print 'Total breeds:', response.data.length

Scenario: Validate complete breeds API response schema
    * method get
    * status 200
    * match response ==
    """
        {
            current_page: '#number',
            data: '#[]',
            first_page_url: '#string',
            from: '#number',
            last_page: '#number',
            last_page_url: '#string',
            links: '#[]',
            next_page_url: '##string',
            path: '#string',
            per_page: '#number',
            prev_page_url: '##string',
            to: '#number',
            total: '#number'
        }
    """

Scenario: Validate schema of the first breed item

    * method get
    * status 200
    * match response.data[0] == 
    """
        {
            "breed": "#string",
            "country": "#string",
            "origin": "#string",
            "coat": "#string",
            "pattern": "#string"
        }
    """
Scenario: Validate required fields for all breed items
    * method get
    * status 200
    * match each response.data contains 
    """
        {
            "breed": "#string",
            "country": "#string",
            "pattern": "#string"
        }
    """

Scenario: Validate API response Content-Type header
    * method get
    * status 200
    * match header  Content-Type contains 'application/json'
 
Scenario: Validate API response time
    * method get
    * status 200
    * assert responseTime < 2000

Scenario: Validate pagination behavior using limit parameter
    * param limit = 5
    * method get
    * status 200
    * assert response.data.length == 5
    * match response.current_page == 1
    * match response.per_page == response.data.length

Scenario: Validate links structure in response
    * method get
    * status 200
    * match response.links == '#[]'
    * assert response.links.length > 0 
    * match each response.links ==
    """
    {
        url: '##string',
        label: '#string',
        active: '#boolean'
        }
    """
Scenario: Validate error response for invalid limit parameter
    * param limit = -1
    * method get
    * status 404
    * match response ==
    """                 
    {
      message: '#string',
      code: 404
    }
    """

