defmodule Solana.MixProject do
  use Mix.Project

  @source_url "https://github.com/ayrat555/solana_ex"
  @version "0.2.0"

  def project do
    [
      app: :solana,
      description: description(),
      version: @version,
      elixir: "~> 1.12",
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      name: "Solana",
      source_url: @source_url,
      homepage_url: @source_url,
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def elixirc_paths(:test), do: ["lib", "test/support"]
  def elixirc_paths(_), do: ["lib"]

  defp description do
    "A library for interacting with the Solana blockchain."
  end

  defp package do
    [
      name: "solana",
      maintainers: ["Airat Badykov"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end

  defp deps do
    [
      # base client
      {:tesla, "~> 1.13.2"},
      # json library
      {:jason, ">= 1.0.0"},
      # keys and signatures
      {:ed25519, "~> 1.3"},
      {:cafezinho, "~> 0.4.3"},
      # base58 encoding
      {:ex_base58, "~> 0.6.3"},
      # validating parameters
      {:nimble_options, "~> 1.1.1"},
      # docs and testing
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: ["README.md", "LICENSE"],
      groups_for_modules: [
        Client: [
          Solana.RPC,
          Solana.RPC.Request,
          Solana.RPC.Tracker
        ],
        Transactions: [
          Solana.Transaction,
          Solana.Instruction,
          Solana.Account,
          Solana.Key
        ],
        "System Program": [
          Solana.SystemProgram,
          Solana.SystemProgram.Nonce
        ],
        Testing: [
          Solana.TestValidator
        ]
      ],
      nest_modules_by_prefix: [
        Solana.RPC,
        Solana.SystemProgram
      ]
    ]
  end
end
