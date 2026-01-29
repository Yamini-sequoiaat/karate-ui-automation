Feature: File upload API

Scenario: Upload file successfully
  * url 'https://practice.expandtesting.com/upload'

  * multipart file file = { read: 'classpath:inputs/log-dummy.txt' }

  * method post
  * status 200

  * match response contains 'File Uploaded!'
  * match response contains 'log-dummy.txt'
  * print response

# Scenario: Upload file using UI
#   * driver 'https://practice.expandtesting.com/upload'

#   # upload file via input[type=file]
#   * input('input[type=file]', 'classpath:inputs/log-dummy.txt')

#   # submit the form
#   * click('button[type=submit]')

#   # validate success
#   * waitFor('h1')
#   * match text('h1') == 'File Uploaded!'
#   * match text('#uploaded-files') contains 'log-dummy.txt'

#   * screenshot()