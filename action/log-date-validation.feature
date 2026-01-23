Feature: Validate the date format from log file

Scenario: Check ISO date format in log-dummy.txt

    * def data = read('../inputs/log-dummy.txt')
    * def jsonData = karate.fromString(data)

    * def runStart = jsonData.RunStart
    * def runEnd = jsonData.RunEnd

    * print 'RunStart:', runStart
    * print 'RunEnd:', runEnd

    * def isoRegex = '^\\d{4}-\\d{1,2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d+[-+]\\d{2}:\\d{2}$'

    * match runStart == '#regex ' + isoRegex
    * match runEnd == '#regex ' + isoRegex
