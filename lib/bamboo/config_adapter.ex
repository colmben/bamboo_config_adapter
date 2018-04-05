defmodule Bamboo.ConfigAdapter do
  @behaviour Bamboo.Adapter
  @moduledoc """

  # Example using SMTPAdapter

  ## Config

      config :my_app, MyApp.Mailer,
        adapter: Bamboo.ConfigAdapter,
        chained_adapter: Bamboo.SMTPAdapter,
        server: "smtp.domain",
        hostname: "www.mydomain.com",
        username: "your.name@your.domain", # or {:system, "SMTP_USERNAME"}
        password: "pa55word", # or {:system, "SMTP_PASSWORD"}

  ## Delivering mail

      def welcome do
        email
        |> Bamboo.ConfigAdapter.put_config(%{server: "smtp.other_domain)})
        |> Mailer.deliver_now()
      end
  """

  alias Bamboo.ConfigAdapter.Email

  def deliver(email, %{chained_adapter: chained_adapter} = config) do
    custom_config = email
    |> Email.get_config()

    email
    |> chained_adapter.deliver(Map.merge(config, custom_config))
  end

  def handle_config(%{chained_adapter: chained_adapter} = config) do
    chained_adapter.handle_config(config)
  end

  def handle_config(config) do
    raise ArgumentError, "#{__MODULE__} requires chained_adapter to be configured, got #{inspect config}"
  end
end