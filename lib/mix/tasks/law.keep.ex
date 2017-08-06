defmodule Mix.Tasks.Law.Keep do
  use Mix.Task
  @taskres [:ok, :noop]

  def run(_) do
    :ok = Mix.env(:test)
    true = Mix.Task.run("deps.compile") in @taskres
    true = Mix.Task.run("compile", ["--warnings-as-errors"]) in @taskres
    :ok = Mix.Task.run("credo", ["--strict"])
    :ok = Mix.Task.run("test", ["--cover"])
    :ok = Mix.Task.run("dialyzer", ["--halt-exit-status"])
  end
end
