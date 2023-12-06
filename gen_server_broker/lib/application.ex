defmodule GenServerBroker do

  use Application

 def start(_type, _opts)
 do
  children = [
    GenServerBroker.Server
  ]
  opts = [strategy: :one_for_one, name: ServerSupervisor ]

  Supervisor.start_link(children, opts)
  end
end
