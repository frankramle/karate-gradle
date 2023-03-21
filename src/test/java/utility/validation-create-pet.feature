Feature: Utility

  # param: res(object)

  Scenario: Get pet

    * url petstore
    * path pet, res.id
    * method GET
    * status 200
    * match response.id == body.id
    * match response == read('classpath:data/response/read_file_schema.json')
