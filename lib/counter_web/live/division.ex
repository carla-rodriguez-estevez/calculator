defmodule Division do
  require Display
  use GenServer

  @moduledoc """
  A division module.
  """
  def do_division(_, 0) do

    {:ok, file} = File.open("resultado.txt", [:read, :write])
    File.write("resultado.txt", "La operación de división solicitada no es posible porque el dividendo es 0", [:append])
    File.close(file)

  end

  def do_division(first, second) do
    resultado = round(first / second)
    Display.escribir("Division ", first, second, resultado)
  end

  defp start_link do
    GenServer.start_link(__MODULE__, [], name: :miDivision) # start server
  end

  @impl true
  def handle_cast({first, second}, state) do
      do_division(first, second)
      {:noreply, state}
  end

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end


  ##Parte que se expone al cliente
  def iniciar() do
    Display.iniciar()
    start_link()
  end

  def operar(first, second) do
    GenServer.cast(:miDivision, {first, second})
  end

  def apagar() do
    Display.apagar()
    GenServer.stop(:miDivision)
    :ok
  end
end
