defmodule CounterWeb.PageLive do
  use CounterWeb, :live_view
  import Calculadora

  def mount(_params, _session, socket) do
    Calculadora.iniciar()
    {:ok,
     socket
     |> assign(number1: 0, number2: 0, result: 0)}
  end

  def handle_event("inc", _params, socket) do
    Calculadora.operar(:suma,socket.assigns.result,1)
    {:noreply,
     socket
     |> update(:result, &(&1 + 1))}

  end

  def handle_event("change1",%{"entry1" => entry1},socket) do
    {:noreply,
     socket
     |> update(:number1, entry1)}
  end

  def handle_event("dec", _params, socket) do
    Calculadora.operar(:resta,socket.assigns.result,1)

    {:noreply,
     socket
     |> update(:result, &max(0, &1 - 1))}

  end

  def handle_event("clear", _params, socket) do
    {:noreply, socket |> update(:result, socket.assigns.number1)}
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
