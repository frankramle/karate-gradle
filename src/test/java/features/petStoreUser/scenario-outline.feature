Feature: Endpoint User

  Background:
    #* def user = 'v2/user'

  Scenario Outline: Create new user | new user: <value>
    # Primero, crear varios usuarios
    # Segundo, validar el escenario outline usando otro endpoint

    Examples:
      | value |

  # Ejercicio
  Scenario Outline:
    # Crear tres usuarios diferentes y luego debo verificar que los tres se hayan creado correctamente
    Examples:
      | param |