Feature: Execute latest file search automation

Scenario: Run latest file locate and validation feature

    * print 'Before calling sleep feature:', new Date().toString()
    * call read('../action/sleep.feature')
    * print 'After sleep feature completed:', new Date().toString()
    
    * call read('../action/latest-matched-file-search.feature')
