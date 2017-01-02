defmodule Lv.Mixfile do
  use Mix.Project

  def project do
    [app: :asapi,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:trot]]
  end

  defp deps do
    [{:trot, github: "hexedpackets/trot"}]
  end
end
