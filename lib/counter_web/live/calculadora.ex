defmodule Calculadora do
  require Verify
  use GenServer

  @moduledoc """
  A calculator module.
  """

  defp start_link do
    GenServer.start_link(__MODULE__, [], name: :miCalculadora) # start server
  end

  @impl true
  def handle_cast({operacion, first, second}, state) do
      Verify.verify(operacion, first, second)
      {:noreply, state}
  end

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end


  #Cliente de la calculadora usa esta parte

  def iniciar() do
    start_link()
    Verify.iniciar()
  end

  def operar(operacion, first, second) do
    GenServer.cast(:miCalculadora, {operacion, first, second})
  end

  def apagar() do
    Verify.apagar()
    GenServer.stop(:miCalculadora)
    :ok
  end


end
