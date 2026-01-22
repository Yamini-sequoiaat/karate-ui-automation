Feature: Execute date validation scenarios

Scenario: Trigger date validation action feature

    * def data = read('../inputs/log-dummy.txt')
    * def jsonData = karate.fromString(data)

    * call read('../action/log-date-validation.feature') { log: '#(jsonData)' }
