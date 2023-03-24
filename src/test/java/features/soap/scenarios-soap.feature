Feature: test soap end point

  Background:
    # Se usara la siguiente WS de prueba: https://www.crcind.com/csp/samples/SOAP.Demo.cls
    # WSDL: https://www.crcind.com/csp/samples/SOAP.Demo.CLS?WSDL

  @soap
  Scenario: Method AddInteger | Using Soap action

    Given url 'https://www.crcind.com:443/csp/samples/SOAP.Demo.cls'
    And request
    """
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org">
       <soapenv:Header/>
       <soapenv:Body>
          <tem:AddInteger>
             <!--Optional:-->
             <tem:Arg1>6</tem:Arg1>
             <!--Optional:-->
             <tem:Arg2>5</tem:Arg2>
          </tem:AddInteger>
       </soapenv:Body>
    </soapenv:Envelope>
    """
    # soap action
    When soap action 'http://tempuri.org/AddInteger'
    Then status 200
    And match /Envelope/Body/AddIntegerResponse/AddIntegerResult == '11'
    * print response

  Scenario: Method AddInteger | Using content-type and HTTP POST

    Given url 'https://www.crcind.com:443/csp/samples/SOAP.Demo.cls'
    And request read('classpath:data/request/soap.xml')
    And header Content-Type = 'application/soap+xml; charset=utf-8'
    When method POST
    Then status 200
    And match /Envelope/Body/AddIntegerResponse == read('classpath:data/response/expected_soap.xml')
    * print response
