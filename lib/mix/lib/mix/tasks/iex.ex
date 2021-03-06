defmodule Mix.Tasks.Iex do
  use Mix.Task

  @shortdoc "Start IEx with your project's settings"

  @moduledoc """
  Starts an iex repl with your project settings.

  Before starting IEx, it invokes the prepare task
  which defaults to compile and load your project.

  ## Command line options

  * `--no-compile` - do not compile even if files require compilation;
  * `--no-start` - do not start applications after compilation;

  """
  def run(args) do
    Mix.Task.run Mix.project[:prepare_task], args

    unless IEx.started? do
      raise Mix.Error, message: "could not start IEx. Due to booting constraints, " <>
        "IEx needs to be started on its own, like `mix iex` and it cannot be mixed " <>
        "with other tasks as in `mix do compile, iex`"
    end
  end
end
