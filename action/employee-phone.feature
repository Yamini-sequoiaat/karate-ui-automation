Feature: Employee phone validation using JS utilities
Scenario: Generate and validate employee phone number

    * def phoneNumber = call read('classpath:resources/phone-faker.js')
    * print 'Generated Phone Number:', phoneNumber

    * def isValid = phoneNumber.startsWith('9') && phoneNumber.length == 10

    * def employee =
        """
            {
                "id": 2651,
                "name": "Test User",
                "role": "QA Engineer",
                "phone": "#(phoneNumber)"
            }
        """

    * if (isValid) karate.log('Valid Employee Data:', employee)

    * def status = isValid ? 'VALID EMPLOYEE' : 'INVALID EMPLOYEE'
    * print 'Employee Status:', status
    * print 'Employee Phone Feature executed successfully.'




