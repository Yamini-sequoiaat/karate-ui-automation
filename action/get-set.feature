Feature:  Manage test context values

Scenario: Store and retrieve values using Karate context

    * karate.set('Username','Yamini')
    * print karate.get('Username')
    * karate.set('role','tester')
    * print karate.get('role')
    * karate.set('isActive', true)
    * print karate.get('isActive')
