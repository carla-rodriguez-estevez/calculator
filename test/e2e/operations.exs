defmodule CounterWeb.OperationsTest do
  use CounterWeb.ConnCase
  use Hound.Helpers


  hound_session()


  #Example test
  test "simple check of title" do
    navigate_to("/")
    Process.sleep(1800)

    title = find_element(:class, "text-5xl")
    assert visible_text(title) == "Calculator"

  end

  #Test all the operations, not the existing elements

  test "Test Suma operation" do
    navigate_to("/")
    Process.sleep(1800)

    first_entry = find_element(:name, "entry1")
    second_entry = find_element(:name, "entry2")
    result_number = find_element(:id,"result-number")
    assert visible_text(result_number) == "0"

    input_into_field(first_entry, 3)
    input_into_field(second_entry, 13)
    Process.sleep(1000)

    click({:id, "operation"})
    click({:id, "Suma"})
    click({:id, "summit-button"})

    assert visible_text(result_number) == "16"

    Process.sleep(1000)
  end

  test "Test Resta operation" do
    navigate_to("/")
    Process.sleep(1800)

    first_entry = find_element(:name, "entry1")
    second_entry = find_element(:name, "entry2")
    result_number = find_element(:id,"result-number")
    assert visible_text(result_number) == "0"

    input_into_field(first_entry, 3)
    input_into_field(second_entry, 13)
    Process.sleep(1000)

    click({:id, "operation"})
    click({:id, "Resta"})
    click({:id, "summit-button"})

    assert visible_text(result_number) == "-10"

    Process.sleep(1000)
  end

  test "Test Multiplicación operation" do
    navigate_to("/")
    Process.sleep(1800)

    first_entry = find_element(:name, "entry1")
    second_entry = find_element(:name, "entry2")
    result_number = find_element(:id,"result-number")
    assert visible_text(result_number) == "0"

    input_into_field(first_entry, 3)
    input_into_field(second_entry, 13)
    Process.sleep(1000)

    click({:id, "operation"})
    click({:id, "Multiplicacion"})
    click({:id, "summit-button"})

    assert visible_text(result_number) == "39"

    Process.sleep(1000)
  end

  test "Test División operation" do
    navigate_to("/")
    Process.sleep(1800)

    first_entry = find_element(:name, "entry1")
    second_entry = find_element(:name, "entry2")
    result_number = find_element(:id,"result-number")
    assert visible_text(result_number) == "0"

    input_into_field(first_entry, 13)
    input_into_field(second_entry, 3)
    Process.sleep(1000)

    click({:id, "operation"})
    click({:id, "Division"})
    click({:id, "summit-button"})

    assert visible_text(result_number) == "4"

    Process.sleep(1000)
  end
end
