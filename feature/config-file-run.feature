Feature: Configuration Test

Background:
    * def configPath = karate.toAbsolutePath('../inputs/test-config.xml')
    
    * configure afterScenario = 
    """
    function() { 
        var cmd = `cmd /c powershell -command "$configPath = '${configPath}'; $doc = (Get-Content $configPath) -as [Xml]; $obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'WaitTimeForPreparation'}; $obj.value = '4000'; $obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'SimulationMode'}; $obj.value = 'false'; $obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'StopAppOnExit'}; $obj.value = 'false'; $doc.Save($configPath)"`;
        
        var revertKeys = karate.fork(cmd);
        revertKeys.waitSync();
    }
    """

Scenario: Modify XML and Execute Application
    * def updateKeys = karate.fork(`cmd /c powershell -command "$configPath = '${configPath}'; $doc = (Get-Content $configPath) -as [Xml]; $obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'WaitTimeForPreparation'}; $obj.value = '8000'; $obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'SimulationMode'}; $obj.value = 'true'; $obj = $doc.configuration.appSettings.add | where {$_.Key -eq 'StopAppOnExit'}; $obj.value = 'true'; $doc.Save($configPath)"`)
    
    * updateKeys.waitSync()
    * def File = Java.type('java.io.File')
    * def content = karate.readAsString('file:' + configPath)
    * match content contains 'value="8000"'