function fn() {
  var config = {};

  // Base URL for API requests
  config.catApiBaseUrl = 'https://catfact.ninja/breeds';
  //  Base URL for xml file download
  config.baseUrl = 'https://sample-files.com/downloads/data/xml/complex-nested.xml';
  // URL for file upload testing
  config.uploadUrl = 'https://practice-automation.com/file-upload/';
  // Petstore API URL
  config.petUrl = 'https://petstore.swagger.io';
  
  // Common headers
  config.commonHeaders = {
    Accept: 'application/json'
  };

  // Common thresholds
  config.maxResponseTime = 2000;

  return config;
}
