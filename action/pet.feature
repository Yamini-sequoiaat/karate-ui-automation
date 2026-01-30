Feature: Pets API Validation

Background: Configure Pets API base request
    * url petUrl

Scenario: Validate response structure for pets with available status
    * path 'v2/pet/findByStatus'
    * param status = 'available'
    * method get
    * status 200
    * match response != null
    * assert response.length > 0
    * print 'Total pets with available status:', response.length
    * match each response contains
    """
        {
        id: "#number",
        name: "#string",
        photoUrls: "##array",
        tags: "##array",
        status: "#string"
        }
    """
    * match each response[*].status == 'available'

Scenario: Validate all returned pets have valid names when status is available
    * path 'v2/pet/findByStatus'
    * param status = 'available'
    * method get
    * status 200
    * def vaildpets = response.filter(pet => pet.status == 'available' && pet.name != 'null')
    * print 'Pets with valid names and available status:', vaildpets
    * assert vaildpets.length > 0

  Scenario: Validate pet names are unique in the available pets list
    * path 'v2/pet/findByStatus'
    * param status = 'available'
    * method get
    * status 200
    * def petNames = response.map(pet => pet.name)
    * def uniquePetNames = karate.distinct(petNames)
    * print 'Unique pet names:', uniquePetNames
    * assert uniquePetNames.length <= petNames.length

 
Scenario: Validate pet IDs are unique in the available pets list
    * path 'v2/pet/findByStatus'
    * param status = 'available'
    * method get
    * status 200
    * def petIds = response.map(pet => pet.id)
    * def uniquePetIds = petIds.filter((id, index) => petIds.indexOf(id) == index)
    * print 'Total pet IDs:', petIds.length
    * print 'Unique pet IDs:', uniquePetIds.length
    * assert petIds.length == uniquePetIds.length

Scenario: Validate new pet is added successfully

    * path 'v2/pet'
    * request
    """
    {
      "id": 5465898,
      "category": {
        "id": 7995,
        "name": "husky"
      },
      "name": "doggie",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 5678,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    * method post
    * status 200
    * match response.id == 5465898
    * match response.name == "doggie"
    * match response.status == "available"

Scenario: Change the status of the newly added pet
    * path 'v2/pet'
    * request
    """
    {
      "id": 5465898,
      "category": {
        "id": 7995,
        "name": "husky"
      },
      "name": "doggie",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 5678,
          "name": "string"
        }
      ],
      "status": "sold"
    }
    """
    * method put
    * status 200
    * match response.id == 5465898
    * match response.status == "sold"
    * print 'Updated pet details:', response
    * print 'Updated pet status to sold for pet ID 5465898'

Scenario: Delete the newly added pet
    * path 'v2/pet/5465898'
    * method delete
    * status 200
    * match response.message == '5465898'
    * print 'Delete response message:', response.message
    * print 'Pet with ID 5465898 deleted successfully'

Scenario: Verify the deleted pet is no longer retrievable
    * path 'v2/pet/5465898'
    * method get
    * status 404
    * match response.message == 'Pet not found'
    * print 'Get response message after deletion:', response.message
    * print 'Verified that pet with ID 5465898 is no longer retrievable'