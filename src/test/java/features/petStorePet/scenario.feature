Feature: Endpoint Pet

  Background:
    * def pet = 'v2/pet'

  Scenario: Create new pet
	# Primero, crear una mascota
    # Segundo, validar con un endpoint la mascota creada
    * def body =
    """
    {
      "id": 1009,
      "name": "Oky_03",
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

    Given url petstore
    And path pet
    And request body
    When method POST
    Then status 200
    And match response.id == body.id
    And match response.name == body.name

    # Validation
    * url petstore
    * path pet, response.id
    * method GET
    * status 200
    * match response.id == body.id

  # Ejercicio
  Scenario: Delete pet
    * def body =
    """
    {
      "id": 10029,
      "name": "Oky_05",
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

    * url petstore
    * path pet
    * request body
    * method POST
    * status 200
    * match response.id == body.id
    * match response.name == body.name

    Given url petstore
    And path pet, response.id
    When method DELETE
    Then status 200

    # Validation
    * url petstore
    * path pet, body.id
    * method GET
    * status 404
