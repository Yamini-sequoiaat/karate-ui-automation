Feature: Config file PowerShell action

Scenario: Execute PowerShell command
    * def command = karate.get('psCommand')
    * print 'Executing PowerShell command'
    * karate.exec(command)