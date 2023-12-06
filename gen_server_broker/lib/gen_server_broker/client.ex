defmodule GenServerBroker.Client do
  @server GenServerBroker.Server




  def create_queue_request(name_of_queue) do

     GenServer.call(@server, {:create_queue, name_of_queue})

  end



end
