
defmodule Suma do
  require Display
  use GenServer

  @moduledoc """
  An add module.
  """
  def do_suma(first, second) do
    resultado = first + second
    Display.escribir("Suma ", first, second, resultado)
  end

  defp start_link do
    GenServer.start_link(__MODULE__, [], name: :miSuma) # start server
  end

  @impl true
  def handle_cast({first, second}, state) do
    do_suma(first, second)
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
    GenServer.cast(:miSuma, {first, second})
  end

  def apagar() do
    GenServer.stop(:miSuma)
    :ok
  end
end
