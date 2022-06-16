
defmodule Multiplicacion do
  require Display
  use GenServer

  @moduledoc """
  A multiplication module.
  """
  def do_mutiplicacion(first, second) do
    resultado = first * second
    Display.escribir("Multiplicacion ", first, second, resultado)
  end

  defp start_link do
    GenServer.start_link(__MODULE__, [], name: :miMultiplicacion) # start server
  end

  @impl true
  def handle_cast({first, second}, state) do
    do_mutiplicacion(first, second)
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
      GenServer.cast(:miMultiplicacion, {first, second})
    end

    def apagar() do
      GenServer.stop(:miMultiplicacion)
      :ok
    end

end
