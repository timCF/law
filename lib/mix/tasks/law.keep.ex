defmodule Mix.Tasks.Law.Keep do
  use Mix.Task

  def run(_) do
    :ok = Mix.env(:test)
    _ = Mix.Task.run("deps.get")
    _ = Mix.Task.run("deps.compile")
    _ = Mix.Task.run("compile", ["--warnings-as-errors"])
    _ = Mix.Task.run("credo", ["--strict"])
    _ = Mix.Task.run("test", ["--cover"])
    _ = Mix.Task.run("dialyzer", ["--halt-exit-status"])
  end
end
