Feature: Array loop and validation using match each

Scenario: Loop over object array and verify required value
    * def employees =
    """
    [
        { id: 1, name: 'Alice', role: 'Admin', active: true },
        { id: 2, name: 'Bob', role: 'User', active: true },
        { id: 3, name: 'Charlie', role: 'Manager', active: false }
    ]
    """

    * match each employees contains
    """
    {
        id: '#number',
        name: '#string',
        role: '#string',
        active: '#boolean'
    }
    """
    * assert employees.length > 0
    * match employees[*].role contains 'Admin'
    * match each employees[*].active == '#boolean'
    * match each employees[*].name != ''

    * def ids = employees.map(e => e.id)
    * match each ids == '#number'
    * assert ids.every(id => id > 0)

    * def roles = employees.map(e => e.role)
    * match each roles == '#string'
    * match roles contains 'Admin'
    * match roles contains any ['Admin', 'Guest']
    * match roles contains only ['Admin', 'User', 'Manager']

