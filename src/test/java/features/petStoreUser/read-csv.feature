Feature: Read CSV

  Background:
    * def user = 'v2/user'

  @csv
  Scenario Outline: Read csv | Create new user
    # Leer un fichero .csv con un registro con expresiones embebidas
    * def req = {id: '#(id)', username: '#(username)', firstName: '#(firstName)', lastName: '#(lastName)', email: '#(email)', password: '#(password)', phone: '#(phone)', userStatus: '#(userStatus)'}
    * string id = req.id
    * print id

    Given url petstore
    And path user
    And request req
    When method POST
    Then status 200
    And match response.message == id

    Examples:
      | read('classpath:data/test_data.csv') |

  Scenario Outline: Read csv | Create new user | username: <username>
    # Leer un fichero .csv con varios registros
    * def req = {id: <id>, username: <username>, firstName: <firstName>, lastName: <lastName>, email: <email>, password: <password>, phone: <phone>, userStatus: <userStatus>}
    * string id = req.id
    * print id

    Given url petstore
    And path user
    And request req
    When method POST
    Then status 200
    And match response.message == id

    Examples:
      | read('classpath:data/test_data02.csv') |