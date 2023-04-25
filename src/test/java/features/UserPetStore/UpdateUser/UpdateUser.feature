Feature: Update User
  @karate-test
  Scenario Outline:
    * call read('classpath:features/utility/UserCreated.feature@CreatedUser'){user:<user>,status:<status>}
    * call read('classpath:features/utility/UserSearch.feature@SearchUser'){user:<user>}
    * def req = read('classpath:data/User_update_data.json')
    Given url UrlUser + "/" + user
    And request req
    When method PUT
    Then status 200

    * call read('classpath:features/utility/UserSearch.feature@SearchUser'){user:<user>}
Examples:
    |user       | status | statusupdate|
    |'fprueba1' |0       |1            |
    |'fprueba2' |0       |1            |
    |'fprueba3' |0       |1            |
