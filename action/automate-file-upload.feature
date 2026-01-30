Feature: File Upload Test

Scenario: Upload file successfully via UI automation
    
    * configure driver = {type : 'chrome'}
    * driver uploadUrl
    * waitFor('#file-upload').input(Key.ENTER).click()
    * delay(2000)

    # Handle OS file dialog
    * robot {window : 'Open' , fork : false}
    * robot.input(Key.ALT + 'd')
    * delay(500)
    * robot.input('Downloads')
    * robot.input(Key.ENTER)
    * delay(1000)
    * robot.input(Key.ALT + 'n')
    * robot.input('log-dummy.txt')
    * delay(500)
    * robot.input(Key.ENTER)
    * delay(2000)
    * screenshot('after-file-selected')

    # Validate file selection
    * def selectedFile = value('#file-upload')
    * print 'Selected file:', selectedFile

    # verify file extension
    * def extension = selectedFile.substring(selectedFile.lastIndexOf('.') + 1)
    * print 'File extension is:', extension
    * def allowedTypes = ['txt','docx','pdf','jpeg','png','jpg','gif']
    * match allowedTypes contains extension

    # Submit upload
    * waitFor('#upload-btn').input(Key.ENTER).click()
    * screenshot('after-upload-clicked')

    # Validate success message
    * waitFor('.wpcf7-response-output')
    * def msg = text('.wpcf7-response-output')
    * print 'Response message is:', msg
    * match msg contains 'Thank you for your message'
    * print 'File upload via UI automation successful'

Scenario: Validate file upload without selecting file

    * configure driver = {type : 'chrome'}
    * driver uploadUrl
    * waitFor('#upload-btn').input(Key.ENTER).click()
    * screenshot('after-upload-clicked-without-file')

    # Validate error message
    * waitFor('.wpcf7-not-valid-tip')
    * def errMsg = text('.wpcf7-not-valid-tip')
    * print 'Error message is:', errMsg
    * match errMsg contains 'Please fill out this field.'
    * def msg = text('.wpcf7-response-output')
    * print 'Response message is:', msg
    * print 'Validation for file upload without selecting file successful'
