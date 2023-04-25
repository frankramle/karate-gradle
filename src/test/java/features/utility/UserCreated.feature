Feature: Usuario REutilizable

  @CreatedUser
    Scenario:
  * def req = read('classpath:data/User_data.json')
    Given url UrlUser
    And request req
    When method POST
    Then status 200
    And match response.message == '1'

