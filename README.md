# calculator
Pype and filter calculator with UI made using Phoenix, Elixir, and LiveView.
This is a public repository based on a Software Architecture project already done and private to test different utilities (credo and dialyxir)

Para arrancar el programa solamente hace falta 

```
mix deps.get
```
y 

```
iex -S mix phx.server
```


A partir de ahí estará disponible tu calculadora en tu navegador ([enlace rápido aquí](http://localhost:4000))


Para correr los test de la interfaz de usuario (que se han realizado con hound) se hace con los siguientes comandos desde la raíz del proyecto, ya que se disponen de dos tests.
```
mix test test/e2e/login.exs
mix test test/e2e/operations.exs
```
**Prerrequisitos para correr los tests:**

Es necesario tener instalado en la máquina chromedriver ya que es lo que invocará los tests para las pruebas, que vienen acompañadas de varios sleeps para poder visualizar correctamente los test conforme se van ejecutando. Además, en el fichero text_helpers se ha añadido ExUnit.start(trace: true) para poder ver por consola que test se ejecutan



![Gracias por visitar el repositorio](https://geekytheory.com/content/images/2014/05/Cat-Illustrations-024.jpg)


**MUCHAS GRACIAS POR VISITAR EL REPOSITORIO**

