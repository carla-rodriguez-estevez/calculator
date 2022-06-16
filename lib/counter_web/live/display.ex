defmodule Display do
  use GenServer
  @moduledoc """
  A display module.
  """
  def copy(%{operacion: operacion_name, first: first_name, second: second_name, resultado: resultado_name}) do

    {:ok, file} = File.open("resultado.txt", [:write, :append])
    File.write("resultado.txt", "la solución a la operación " <> operacion_name <> " para los valores " <> Integer.to_string(first_name) <> " & " <> Integer.to_string(second_name) <> " da como solución " <> Integer.to_string(resultado_name) <> " \n", [:append])
    File.close(file)

  end

  defp start_link do
    GenServer.start_link(__MODULE__, [], name: :miDisplay) # start server
  end

  @impl true
  def handle_cast({operacion_name, first_name, second_name, resultado_name}, state) do
      op1 = %{operacion: operacion_name, first: first_name, second: second_name, resultado: resultado_name}
      copy(op1)
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

  def escribir(operacion_name, first_name, second_name, resultado_name) do
    GenServer.cast(:miDisplay, {operacion_name, first_name, second_name, resultado_name})
  end

  def apagar() do
    GenServer.stop(:miDisplay)
    :ok
  end
end

#op1 = %{operacion: "suma",first: 1,second: 2,resultado: 9}
