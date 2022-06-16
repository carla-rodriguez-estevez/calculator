
defmodule Verify do
  require Suma
  require Resta
  require Multiplicacion
  require Division
  use GenServer

  @moduledoc """
  A verify module.
  """
  def do_verification(operation, first, second),
                  do: do_verification_auxiliar(operation, first, second, is_integer(first) && is_integer(second))

  defp do_verification_auxiliar(_, _, _, false) do
    {:ok, file} = File.open("resultado.txt", [:write, :append])
    File.write("resultado.txt", "los datos introducidos no son integers\n", [:append])
    File.close(file)

  end

  defp do_verification_auxiliar(operation, first, second, true) do
    do_verification_specific(operation, first, second)
  end

  defp do_verification_specific(:suma, first, second) do
    Suma.operar(first, second)
  end

  defp do_verification_specific(:resta, first, second) do
    Resta.operar(first, second)
  end

  defp do_verification_specific(:division, first, second) do
    Division.operar(first, second)
  end

  defp do_verification_specific(:multiplicacion, first, second) do
    Multiplicacion.operar(first, second)
  end

  defp do_verification_specific(_, _, _) do
    {:ok, file} = File.open("resultado.txt", [:read, :write])

    File.write(
      "resultado.txt",
      "Operación no reconocida por la caculadora, pruebe con las opciones: \n :suma \n :resta \n :multiplicacion \n :division \n",
      [:append]
    )

    File.close(file)
  end

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end

  defp start_link do
    GenServer.start_link(__MODULE__, [], name: :miVerification) # start server
  end

  @impl true
  def handle_cast({operacion, first, second}, state) do
     do_verification(operacion, first, second)
      {:noreply, state}
  end

  ##Parte cliente expuesta

  def iniciar() do
    Suma.iniciar()
    Resta.iniciar()
    Multiplicacion.iniciar()
    Division.iniciar()
    start_link()
  end

  def verify(operacion, first, second) do
    GenServer.cast(:miVerification, {operacion, first, second})
  end

  def apagar() do
    Suma.apagar()
    Resta.apagar()
    Multiplicacion.apagar()
    Division.apagar()
    GenServer.stop(:miVerification)
    :ok
  end
end
