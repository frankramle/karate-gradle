Feature: Escenarios reutilizables para USER

  @crearUsuario
  Scenario:
    * def userBody = read('classpath:../data/crearUsuarioPost.json')
    Given url baseUrl
    And request userBody
    When method POST
    Then status 200
    * print response

  @consultarUsuario
  Scenario:
    * def userBody = read('classpath:../data/crearUsuarioPost.json')
    Given url baseUrl+"/"+usuarioCreado
    When method GET
    Then status 200
    * print response