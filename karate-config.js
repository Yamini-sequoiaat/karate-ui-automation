function fn() {
  var config = {};

  // Base URL
  config.catApiBaseUrl = 'https://catfact.ninja/breeds';

  // Common headers
  config.commonHeaders = {
    Accept: 'application/json'
  };

  // Common thresholds
  config.maxResponseTime = 2000;

  return config;
}
