defmodule CounterWeb.PageLive do
  use CounterWeb, :live_view
  import Calculadora

  def mount(_params, _session, socket) do
    Calculadora.iniciar()
    {:ok,
     socket
     |> assign(number1: 0, number2: 0, result: 0)}
  end


  def handle_event("submit", %{"entry1" => entry1, "entry2" => entry2, "operation" => operation}, socket) do
    IO.puts(String.to_atom(operation))

    case operation do
      ":suma" -> Calculadora.operar(:suma,String.to_integer(entry1),String.to_integer(entry2))
        {:noreply,socket|> update(:result, fn _ -> String.to_integer(entry1) + String.to_integer(entry2) end)}


      ":resta" -> Calculadora.operar(:resta,String.to_integer(entry1),String.to_integer(entry2))
         {:noreply,socket|> update(:result, fn _ -> String.to_integer(entry1) - String.to_integer(entry2) end)}


      ":division" -> Calculadora.operar(:division,String.to_integer(entry1),String.to_integer(entry2))
        {:noreply,socket|> update(:result, fn _ ->trunc( String.to_integer(entry1) / String.to_integer(entry2)) end)}


      ":multiplicacion" -> Calculadora.operar(:multiplicacion,String.to_integer(entry1),String.to_integer(entry2))
        {:noreply,socket|> update(:result, fn _ -> String.to_integer(entry1) * String.to_integer(entry2) end)}


    end
  end

end
