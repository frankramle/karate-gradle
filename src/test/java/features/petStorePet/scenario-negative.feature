Feature: Scenarios Negatives

  Background:
    * def pet = 'v2/pet'

  Scenario: Create new pet without name - Element required - Bad Request
    # Intentar crear un recurso sin un campo obligatorio

  Scenario: Delete pet nonexistent - Not Found
    # Intentar eliminar un recurso que no existe

  # Ejercicio
  Scenario: Create new pet without name 02 - Element required - Bad Request
    # Eliminar una mascota reutilizando la lectura de fichero