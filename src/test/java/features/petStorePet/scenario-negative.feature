Feature: Scenarios Negatives

  Background:
    * def pet = 'v2/pet'

  Scenario: Create new pet without name - Element required - Bad Request
    # Intentar crear un recurso sin un campo obligatorio
    * def body =
    """
    {
      "id": 1009,
      "category": {
        "id": 1,
        "name": "Dogs"
      },
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    * print body

    Given url petstore
    And path pet
    And request body
    When method POST
    Then status 400

  Scenario: Delete pet nonexistent - Not Found
    # Intentar eliminar un recurso que no existe
    * def id = 10000000009

    Given url petstore
    And path pet, id
    When method DELETE
    Then status 404
    And match response.code == 404

  # Ejercicio
  Scenario: Create new pet without name 02 - Element required - Bad Request
    # Eliminar una mascota reutilizando la lectura de fichero
      # Usamos "remove" de karate DSL
      # Hacemos un print de nuestro body para ver por consola que realmente eliminamos el name
      # Intentar crear un recurso sin un campo obligatorio
    * def body = read('classpath:data/request/read_file_body.json')
    * remove body.name

    Given url petstore
    And path pet
    And request body
    When method POST
    Then status 400