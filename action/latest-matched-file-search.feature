Feature: Search word in latest created file

Scenario: Validate search word exists in latest txt file only

    * def folderPath = 'C:/Users/SAT-0113/AutomationTest/test-karate/inputs'
    * def searchWord = 'Process run successfully'

    * def File = Java.type('java.io.File')
    * def files = new File(folderPath).listFiles()
    * def txtFiles =
    """
    karate.filter(files, function(f){
        return f.isFile() && f.getName().endsWith('.txt');
    })
    """
    * assert txtFiles.length > 0
    
    * def latestFile =
    """
    txtFiles.sort(function(a, b){
        return b.lastModified() - a.lastModified();
    })[0]
    """
    * print 'Latest file:', latestFile.getName()
    * def content = karate.readAsString('file:' + latestFile.getAbsolutePath())
    * match content contains searchWord
    * print 'Search word found:', searchWord

