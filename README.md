# Arquetipo Básico de Pruebas Automatizadas con Karate DSL

## Pre-requisitos

1. Tener instalado gradle y agregarlo en el path de la variable de entorno.
2. IDE IntelliJ IDEA
3. Java 11

## Complementos

> **NOTA**:
> * Una vez obtenido Intellij es necesario instalar los plugins de Gherkin y Cucumber. (*[Guia de instalación plugins en intellij](https://www.jetbrains.com/help/idea/managing-plugins.html)*)
>

## Ejecución local

Clonar el proyecto

```bash
  git clone https://github.com/frankramle/karate-gradle.git
```

Entrar al directorio del proyecto

```bash
  cd karate-gradle
```
## Comandos

Para decargar todas las dependencias
```bash
  gradle clean build -x test 
```
Para ejecutar todos los features por linea de comandos
```bash
  gradle clean test 
```

> **NOTA**:
> * Para ejecutar el proyecto se necesita Java JDK 1.8 y Gradle con la versión 4.10.2 o superior.
> * Otra alternativa para no instalar gradle es usar el comando gradlew al momento de ejecutar el proyecto como se muestro anteriormente.
> * Luego de la ejecucion de pruebas, los reportes se generan en la carpeta **build/karate-reports/**, y el archivo de resumen es el **karate-summary.html**

## Construido con:
La automatización fue desarrollada con:

* BDD - Estrategia de desarrollo
* Gradle - Manejador de dependencias
* Gherkin - Lenguaje Business Readable DSL (Lenguaje especifico de dominio legible por el negocio)

## Documentacion

[Karate DSL](https://github.com/karatelabs/karate)

