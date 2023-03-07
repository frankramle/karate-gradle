Arquetipo básico de pruebas automatizadas de APIs usando la herramienta karate


## Complementos


> **NOTA**:
> * Una vez obtenido Intellij es necesario instalar los plugins de Gherkin y Cucumber. (*[Guia de instalación plugins en intellij](https://www.jetbrains.com/help/idea/managing-plugins.html)*)
>

## Ejecución local

Clonar el proyecto

```bash
  git clone https://BancoPichinchaEC@dev.azure.com/BancoPichinchaEC/BP-Quality-Management/_git/sqa-aut-arq-karate
```

Entrar al directorio del proyecto

```bash
  cd sqa-aut-arq-karate
```
## Modificación del codigo

- Para realizar modificaciones al codigo del proyecto. realizar los siguientes pasos: 

     
	 1. Importar el proyecto desde IntelliJ IDE bajo la estructura de un proyecto Gradle existente
	 2. Configurar JRE System Library con JavaSE-1.8
	 3. Configurar la codificación a UTF-8 al proyecto una vez sea importado

## Comandos

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

