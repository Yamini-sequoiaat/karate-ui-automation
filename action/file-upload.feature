Feature: File upload UI test

Scenario: Upload file using HTML form

#   * configure robot = { highlight: true }

#   * robot { fork: 'C:/Program Files/Google/Chrome/Application/chrome.exe', url: 'http://localhost:5500/inputs/upload.html' }

#   * delay(1000)

#   * input('#fileInput', 'C:/Users/SAT-0113/Desktop/log-dummy.txt')
#   * click('#uploadBtn')

#   * print 'UI file upload executed'

    * configure driver = { type: 'chrome', timeout: 10000 }

    # Open local HTML file
    * def htmlPath = karate.toAbsolutePath('classpath:resources/upload.html')
    * driver 'file:' + htmlPath

    # Wait until file input is visible
    * waitFor('#fileInput')

    # Convert file to absolute path (VERY IMPORTANT)
    * def filePath = karate.toAbsolutePath('classpath:inputs/log-dummy.txt')

    # Select file
    * input('#fileInput', filePath)

    # Click upload button
    * click('#uploadBtn')

    # Take screenshot after upload
    * screenshot()

    # Verify uploaded file name is displayed
    * match text('#uploadedFileName') contains 'log-dummy.txt'






    # * configure driver = { timeout: 10000 }

    # * driver 'http://localhost:5500/inputs/upload.html'

    # * input('#fileInput', 'C:/Users/SAT-0113/AutomationTest/test-karate/inputs/log-dummy.txt')

    # * screenshot('before-upload.png')
    # * click('#uploadBtn')
    # * screenshot('after-upload.png')
    # * print 'UI file upload executed'
    # * match text('#uploadedFileName') contains 'log-dummy.txt'

    

        # * configure driver = { type: 'chrome', timeout: 10000 }

        # * driver 'http://localhost:5500/inputs/upload.html'

        # * waitFor('#fileInput')
        # * clear('#fileInput')

        # * upload('#fileInput', 'C:/Users/SAT-0113/Desktop/log-dummy.txt')

        # * def fileCount = script("document.querySelector('#fileInput').files.length")
        # * print 'Selected file count:', fileCount
        # * match fileCount == 1

        # * def fileName = script("document.querySelector('#fileInput').files[0].name")
        # * print 'Selected file name:', fileName
        # * match fileName == 'log-dummy.txt'

        # * eval showFileName()

        # # * screenshot('before-upload')

        # # * click('#uploadBtn')

        # # * screenshot('after-upload')
        # * match text('#uploadedFileName') contains 'log-dummy.txt'

        # * print 'UI file upload executed'



        # * driver 'http://localhost:5500/inputs/upload.html'

        # # 1️⃣ Click file input to open dialog
        # * click('#fileInput')

        # # 2️⃣ Small wait for OS dialog (important)
        # * delay(1000)

        # # 3️⃣ Attach to Open window (use regex)
        # * robot { window: '^Open', highlight: true }

        # # 4️⃣ Type full file path
        # * input('C:/Users/SAT-0113/Downloads/log-dummy.txt')

        # # 5️⃣ Press Enter
        # * input(Key.ENTER)

        # # 6️⃣ Click Upload button
        # * click('#uploadBtn')

        # # 7️⃣ Assertion
        # * waitUntil(() => text('#uploadedFileName') != '')
        # * match text('#uploadedFileName') contains 'log-dummy.txt'