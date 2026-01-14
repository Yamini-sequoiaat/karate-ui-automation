Feature: Windows Calculator

Scenario:  Perform calculator operations
  * robot { window: 'Calculator', fork: 'calc', titleContains: true }
  * click('Clear')

  * def opMap = { add: 'Plus', subtract: 'Minus', multiply: 'Multiply by', divide: 'Divide by' }
  * click(num1)   
  * click(opMap[operation])
  * click(num2)
  * click('Equals')

  * def result = locate('#CalculatorResults').name
  * match result == 'Display is ' + expected
