Feature: Windows Calculator using Table

Scenario Outline: Calculator operations using table

    * robot { window: 'Calculator', fork: 'calc', highlight: false }
    * robot.delay(2000)
    * robot.focus('Calculator')
    * robot.delay(200)

    * click('Clear')
    * click('<num1>')
    * click('<operator>')
    * click('<num2>')
    * click('Equals')

    * match locate('#CalculatorResults').name == 'Display is <expected>'
    * click('Close Calculator')


Examples: 
    | num1 | operator      | num2 | expected |
    | Seven| Plus          | Two  | 9        |
    | Five | Minus         | One  | 4        |
    | Nine | Multiply by   | Two  | 18       |
    | Six  | Divide by     | Three| 2        |