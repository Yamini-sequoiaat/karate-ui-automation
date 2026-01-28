function fn() {
  var config = {};

  // Base URL for API requests
  config.catApiBaseUrl = 'https://catfact.ninja/breeds';
  // Base URL for xml file download
  config.baseUrl = 'https://sample-files.com/downloads/data/xml/complex-nested.xml';
  // Base URL for file upload UI and API testing
  //config.uploadUiUrl = 'http://localhost:5500/inputs/upload.html';
  
  // Common headers
  config.commonHeaders = {
    Accept: 'application/json'
  };

  // Common thresholds
  config.maxResponseTime = 2000;

  return config;
}
