Feature: Utility

  # param: param_url (string)
  # param: param_path (string)
  # param: param_body (object)

  @ignore
  Scenario: Post Pet

    * url param_url
    * path param_path
    * request param_body
    * method POST
    * status 200
    * def res = response
