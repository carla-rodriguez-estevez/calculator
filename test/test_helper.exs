spawn(fn -> :os.cmd(:chromedriver) end)
Process.sleep(500)
Application.ensure_all_started(:hound)
ExUnit.start(trace: true)
