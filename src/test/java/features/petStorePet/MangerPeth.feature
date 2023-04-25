Feature: Endpoint Pet
  Background:
    * def pet = 'v2/pet'
    * def pstatus = 'v2/pet/findByStatus'
    * def sleep =
      """
      function(seconds){
        for(i = 0; i <= seconds; i++)
        {
          java.lang.Thread.sleep(1*1000);
          karate.log(i);
        }
      }
      """
 # Escenario de manejo de mascotas
  @pets
  Scenario Outline: Create new pet | new pet: <name>
    # Registro de usuarios
    * def req = { id: '#(id)',  category: {  id: '#(idcat)',  name: '#(namecat)'  }, name: '#(name)',  photoUrls: [ '#(photoUrls)'  ],  tags: [  {  id:'#(idtag)',  name: '#(nametag)'  }  ],  status: '#(status)'  }
    * print id
    Given url petstore
    And path pet
    And request req
    When method POST
    Then status 200
    And match response.name == req.name
    * def id_pet = $.id
      #Validamos el registro de la mascota

    * print '----------------Validar la mascota ingresada---------------'
    And path pet, id_pet
    And request req
    When method GET
    Then status 200
    And match response.id == id_pet
    #Actualizacion de mascota
    * print '----------------Actualization de mascot---------------'
    * def req1 = { id: '#(id)',  category: {  id: '#(idcat)',  name: '#(namecat)'  }, name: '#(name)',  photoUrls: [ '#(photoUrls)'  ],  tags: [  {  id:'#(idtag)',  name: '#(nametag)'  }  ],  status: '#(status)'  }
    * req1.id = id_pet
    * req1.name = 'mr. dog'
    * req1.status =  'sold'
    * print req1
    Given url petstore
    And path pet
    And request req1
    When method PUT
    Then status 200
    * call sleep 5
    #Valida Actualizacion de mascota
    * print '----------------Validar actualizacion mascota ingresada---------------'
    Given url petstore
    And path pstatus
    And param status  = 'sold'
    When method GET
    Then status 200
    Examples:
      |  read('classpath:data/test_data.csv')|


