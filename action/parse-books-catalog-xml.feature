Feature: Parse and Consolidate XML Book Data (Action)

  Background:
    * def baseUrl = 'https://sample-files.com/downloads/data/xml/complex-nested.xml'

  Scenario:
    * url baseUrl
    * method get
    * status 200

    * def xmlResponse = response
    * def books = get xmlResponse //book

    * def result =
    """
    karate.map(books, function(book, i) {
        var title = karate.xmlPath(book, '/book/title') || 'No Title';
        var first = karate.xmlPath(book, '/book/author/name/first') || 'Unknown';
        var last  = karate.xmlPath(book, '/book/author/name/last') || 'Author';
        var publisher = karate.xmlPath(book, '/book/publisher/name') || 'Unknown Publisher';
        return (i+1) + '. ' + title + ' by ' + first + ' ' + last + ' (' + publisher + ')';
    })
    """

    * print 'Total Books:', books.length
    * print result

   
