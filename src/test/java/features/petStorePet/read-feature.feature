Feature: Read File

  Background:
    * def pet = 'v2/pet'

  Scenario: Delete pet - Using utility post
    # Eliminar una mascota pero antes debo asegurarme:
      # Antes del test, la mascota debe crearse (utilidad del post generico)
      # Despues del test, verificar si la mascota esta eliminada correctamente
    * def body = read('classpath:data/request/read_file_body.json')
    * def expected_response = read('classpath:data/response/read_file_schema.json')

    * def post_pet = call read('classpath:utility/post-generic.feature') {param_url: '#(petstore)', param_path: '#(pet)', param_body: '#(body)'}
    * print post_pet.res
    
    * string id = post_pet.res.id
    Given url petstore
    And path pet, post_pet.res.id
    When method DELETE
    Then status 200
    And match response.message == id

    # Validation
    * url petstore
    * path pet, body.id
    * method GET
    * status 404

  Scenario: Create Pet - Reusing utility
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
    * call read('classpath:utility/validation-create-pet.feature') {res: '#(response)'}

  # Ejercicio
  Scenario: Update pet
    # Actualizar una mascota segun el contrato, el test debe contener:
      # Antes del test la mascota este creada correctamente
      # Despues del test, verificar que la mascota este actualizada correctamente
      # Usar lecturas de ficheros e utilidades

    # Create Pet
    * def body = read('classpath:data/request/read_file_body.json')
    * def post_pet = call read('classpath:utility/post-generic.feature') {param_url: '#(petstore)', param_path: '#(pet)', param_body: '#(body)'}

    # Update name in Pet
    * def new_name = 'Oky_Update'
    * body.name = new_name

    Given url petstore
    And path pet
    And request body
    When method PUT
    Then status 200
    And match response.name == new_name

    # Validation
    * call read('classpath:utility/validation-update-pet.feature') {res: '#(response)'}