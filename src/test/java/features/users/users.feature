Feature: sample karate test script

  Background:
  * karate.log('SEGUNDO');

  Scenario: get all users and then get the first user by id
    * karate.log('TERCERO');

    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users'
    When method GET
    Then status 200
    And match response == '#[_ > 11]'

  Scenario Outline: Example Outline
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users'
    When method GET
    Then status 200

   * def resource = <resource>

   Given path 'users', resource.id
   When method get
   Then status 200

   Examples:
    | resource    |
    | response[0] |
    | response[9] |