defmodule CounterWeb.LoginTest do
  use CounterWeb.ConnCase
  use ExUnit.Case, async: true
  use Hound.Helpers


  #hound_session()
  setup do
    Hound.start_session
    :ok
  end

  test "simple check of title" do

    navigate_to("/")
    Process.sleep(1800)

    title = find_element(:class, "text-5xl")
    assert visible_text(title) == "Calculator"

  end

  #Test all the elements exists

  test "Check the frontend text elements" do
    navigate_to("/")
    Process.sleep(1800)

    first_operator = find_element(:id, "first-text")
    second_operator = find_element(:id, "second-text")
    result = find_element(:id, "result-text")
    result_number = find_element(:id,"result-number")

    assert visible_text(first_operator) == "First operator:"
    assert visible_text(second_operator) == "Second operator:"
    assert visible_text(result) == "Result:"
    assert visible_text(result_number) == "0"

  end

  test "Check the buttons and entries are displayed" do
    navigate_to("/")
    Process.sleep(1800)

    first_entry = find_element(:name, "entry1")
    second_entry = find_element(:name, "entry2")
    button = find_element(:id, "summit-button")

    assert element_displayed?(first_entry)
    assert element_displayed?(second_entry)
    assert element_displayed?(button)

  end

  test "Check display operation options" do
    navigate_to("/")
    Process.sleep(1800)

    display = find_element(:id, "operation")
    click(display)

    suma = find_element(:id,"Suma")
    resta = find_element(:id,"Resta")
    division = find_element(:id,"Division")
    multiplicacion = find_element(:id,"Multiplicacion")

    assert visible_text(suma) == "Suma"
    assert visible_text(resta) == "Resta"
    assert visible_text(multiplicacion) == "Multiplicación"
    assert visible_text(division) == "División"

  end

end
