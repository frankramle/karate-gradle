function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  karate.log('PRIMERO');

  if (!env) {
    env = 'dev';
  }

  var petstore = 'https://petstore.swagger.io';

  var config = {
    env: env,
    myVarName: 'someValue',
    petstore: petstore
  }

  return config;
}