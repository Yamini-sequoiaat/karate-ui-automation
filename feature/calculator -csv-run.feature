Feature: Calculator Caller – CSV

Scenario: Execute calculator tests using CSV data
  * def testData = read('../inputs/calculator-data.csv')
  * def run = function(row){ karate.call('../action/calculatorCsv.feature', row) }
  * eval karate.forEach(testData, run)