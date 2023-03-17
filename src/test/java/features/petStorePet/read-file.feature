Feature: Read File

  Background:
    * def pet = 'v2/pet'

  Scenario: Validate schema
    # Primero, crear una mascota
    # Segundo, leer un fichero json para validar el esquema
    # Tercero, validar con otro endpoint
    * def body = read('classpath:data/request/read_file_body.json')
    * def expected_response = read('classpath:data/response/read_file_schema.json')

    Given url petstore
    And path pet
    And request body
    When method POST
    Then status 200
    And match response.id == body.id
    And match response.name == body.name
    And match response == expected_response

    # Validation
    * url petstore
    * path pet, response.id
    * method GET
    * status 200
    * match response.id == body.id
    * match response == read('classpath:data/response/read_file_schema.json')


  #Ejercicio
  Scenario: Delete pet
    # Eliminar una mascota pero antes debo asegurarme:
      # Antes del test la mascota este creada correctamente
      # Despues del test la mascota este eliminada correctamente
      # Leer el request
