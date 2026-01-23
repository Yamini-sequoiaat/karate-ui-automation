Feature: Execute date validation scenarios

Scenario: Trigger date validation action feature

    * call read('../action/log-date-validation.feature') { log: '#(jsonData)' }
