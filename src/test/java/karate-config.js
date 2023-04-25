function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  karate.log('PRIMERO');

  if (!env) {
    env = 'dev';
  }

  var petstore = 'https://petstore.swagger.io';
  var UrlUser = 'https://petstore.swagger.io/v2/user';
    var config = {
    env: env,
    myVarName: 'someValue',
    petstore: petstore,
      UrlUser: UrlUser
  }

  return config;
}