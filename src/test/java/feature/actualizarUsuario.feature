Feature: Actualizar Usuarios
  @karate-test
  Scenario Outline: Actualizar usuarios
    * call read('../utility/user_snippet.feature@crearUsuario'){usuarioCreado:<usuarioCreado>, statusCreado:<statusCreado>}
    * call read('../utility/user_snippet.feature@consultarUsuario'){usuarioCreado:<usuarioCreado>}
    * def userBody = read('classpath:../data/actualizarUsuarioPut.json')

    Given url baseUrl+"/"+usuarioCreado
    And request userBody
    When method PUT
    Then status 200
    * call read('../utility/user_snippet.feature@consultarUsuario')
    Examples:
      | usuarioCreado | correoCreado   | statusCreado | statusActualizado | correoActualizado |
      | Ana           | Sara@gmail     | 0            | 1                 | Sara1@gmail       |
      | Gabriel       | Orlando@gmail  | 0            | 1                 | Orlando1@gmail    |
      | Fany          | Victoria@gmail | 0            | 1                 | Victoria1@gmail   |