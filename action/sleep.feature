Feature: Sleep utility

Scenario: Sleep for 1 minute

    * print 'Sleep started at:', new Date().toString()
    * def Thread = Java.type('java.lang.Thread')
    * eval Thread.sleep(60000)

    * print 'Sleep ended at:', new Date().toString()


