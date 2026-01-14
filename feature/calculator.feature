Feature: windows calculator

Scenario: Add two numbers

    * robot { window: 'Calculator', fork: 'calc', highlight: false }
    * robot.delay(2000)

    * robot.focus('Calculator')
    * robot.delay(200)
    * click('Clear')
    * click('One')
    * click('Plus')
    * click('Two')
    * click('Equals')
    * match locate('#CalculatorResults').name == 'Display is 3'
    * click('Close Calculator')

Scenario: Multiply two numbers

    * robot { window: 'Calculator', fork: 'calc', highlight: false }
    * robot.delay(2000)

    * robot.focus('Calculator')
    * robot.delay(200)
    * click('Clear')
    * click('One')
    * click('Multiply by')
    * click('Two')
    * click('Equals')
    * match locate('#CalculatorResults').name == 'Display is 2'
    * click('Close Calculator')

