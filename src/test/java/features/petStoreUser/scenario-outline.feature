Feature: Endpoint User

  Background:
    * def user = 'v2/user'

  Scenario Outline: Create new user | new user: <username>
    # Primero, crear varios usuarios
    # Segundo, validar el escenario outline usando otro endpoint
    * def req = {id: <id>, username: <username>, firstName: <firstName>, lastName: <lastName>, email: <email>, password: <password>, phone: <phone>, userStatus: <userStatus>}
    * string id = <id>

    Given url petstore
    And path user
    And request req
    When method POST
    Then status 200
    And match response.message == id

    Examples:
      | id    | username     | firstName | lastName | email             | password | phone     | userStatus |
      | 10013 | 'karate_11'  | 'Adrian'  | 'Ramos'  | 'email@gmail.com' | 'pass01' | 324345345 | 0          |
      | 10015 | 'karate_12'  | 'Alicia'  | 'Leon'   | 'email@gmail.com' | 'pass02' | 314345345 | 1          |

  # Ejercicio
  Scenario Outline: Create new user 2 | new user: <username>
    # Crear tres usuarios diferentes y luego debo verificar que los tres se hayan creado correctamente
        # Primero, crear varios usuarios
    # Segundo, validar el escenario outline usando otro endpoint
    * def req = {id: <id>, username: <username>, firstName: <firstName>, lastName: <lastName>, email: <email>, password: <password>, phone: <phone>, userStatus: <userStatus>}
    * string id = <id>

    Given url petstore
    And path user
    And request req
    When method POST
    Then status 200
    And match response.message == id

    * url petstore
    * path user, <username>
    * method GET
    * status 200
    * match response.username == <username>

    Examples:
      | id    | username     | firstName | lastName | email             | password | phone     | userStatus |
      | 10023 | 'karate_21'  | 'Adrian'  | 'Ramos'  | 'email@gmail.com' | 'pass01' | 324345345 | 0          |
      | 10026 | 'karate_22'  | 'Alicia'  | 'Leon'   | 'email@gmail.com' | 'pass02' | 314345345 | 1          |
      | 10027 | 'karate_22'  | 'Alicia'  | 'Leon'   | 'email@gmail.com' | 'pass02' | 314345345 | 1          |