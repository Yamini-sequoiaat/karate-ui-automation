Feature: Find files smaller than given size using PowerShell

Scenario: Find files less than 2MB

    * def directoryPath = 'C:\\Users\\Public\\Documents'
    * def sizeLimitMB = 2

   * def command = "Get-ChildItem -Path '" + directoryPath + "' -Recurse -File | Where-Object { $_.Length -lt 2MB } | Select-Object Name, FullName"
    * def result = karate.exec('powershell -Command "' + command + '"')
    * print result

