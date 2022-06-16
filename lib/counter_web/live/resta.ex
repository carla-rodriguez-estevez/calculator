#import Display
defmodule Resta do
  require Display
  use GenServer

  @moduledoc """
  A substraction module.
  """

  def do_resta(first, second) do
    resultado = first - second
    Display.escribir("Resta ", first, second, resultado)
  end

  defp start_link do
    GenServer.start_link(__MODULE__, [], name: :miResta) # start server
  end

  @impl true
  def handle_cast({first, second}, state) do
    do_resta(first, second)
      {:noreply, state}
  end

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end


  ##Parte que se expone al cliente
  def iniciar() do
    start_link()
  end

  def operar(first, second) do
    GenServer.cast(:miResta, {first, second})
  end

  def apagar() do
    GenServer.stop(:miResta)
    :ok
  end
end
