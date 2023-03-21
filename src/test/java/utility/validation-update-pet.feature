Feature: Utility

  # param: res(object)

  Scenario: Validation Update Pet
    * url petstore
    * path pet, res.id
    * method GET
    * status 200
    * match response == read('classpath:data/response/read_file_schema.json')
    * match response.name == res.name
