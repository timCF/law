defmodule Law do
  @moduledoc """
  Documentation for Law.
  """
  project_top_path = Mix.Project.deps_path() |> Path.join("..") |> IO.inspect
  git_hooks_path = Path.join(project_top_path, ".git/hooks") |> IO.inspect
  case File.exists?(git_hooks_path) do
    true ->
      #
      # TODO
      #
      :ok
    false ->
      raise("It seems path #{git_hooks_path} is not exist. To keep the Law, your Elixir project should be in git repository.")
  end
end
