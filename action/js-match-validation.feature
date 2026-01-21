Feature: Demonstrate correct and incorrect assertion handling inside JavaScript functions

Scenario: False positive due to ignored assertion result in JavaScript function
  * def invalidCheck =
  """
    function(actual, expected) {
        karate.match(actual, expected);
        return true;
  }
  """

  * def actual = { value: 1 }
  * def expected = { value: 2 }

  * def result = invalidCheck(actual, expected)
  * print 'Wrong function result:', result
  * match result == true

Scenario: Proper validation by returning assertion outcome from JavaScript function
  * def validCheck =
  """
    function(actual, expected) {
        var isMatch = karate.match(actual, expected).pass;
        return isMatch;
    }
  """

  * def actual = { value: 1 }
  * def expected = { value: 2 }

  * def result = validCheck(actual, expected)
  * print 'Correct function result:', result
  * match result == false
# * match result == true // This would fail because the objects do not match
