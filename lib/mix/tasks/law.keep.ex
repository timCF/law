defmodule Mix.Tasks.Law.Keep do
  use Mix.Task

  def run(_) do
    :ok = Mix.env(:test)
    :ok = Mix.Task.run("deps.compile")
    :ok = Mix.Task.run("compile", ["--warnings-as-errors"])
    :ok = Mix.Task.run("credo", ["--strict"])
    :ok = Mix.Task.run("test", ["--cover"])
    :ok = Mix.Task.run("dialyzer", ["--halt-exit-status"])
  end
end
