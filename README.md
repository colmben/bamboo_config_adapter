# Bamboo.ConfigAdapter

In some cooporate environments sending emails isn't simply picking a
server and sending it to that server. Sometimes different emails require
different types of configurations that are only known at runtime. Does
this sound like your problem? This may seem convoluted, but this
happens and Bamboo.ConfigAdapter is here to help.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bamboo_config_adapter` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bamboo_config_adapter, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bamboo_config_adapter](https://hexdocs.pm/bamboo_config_adapter).
