Feature: Usuario REutilizable
    @SearchUser
    Scenario: search
      Given url UrlUser + "/" + user
      When method GET
      Then status 200
