defmodule GenServerBroker.Client do
  @server GenServerBroker.Server


  def set_mode() do



  end


  def create_queue(name_of_queue) do



     GenServer.call(@server, {:create_queue, name_of_queue})

  end

  def subscribe_to_queue(name_of_queue) do

    GenServer.call(@server, {:subscribe_to_queue, name_of_queue, self()})

  end

  def send_message({message_lenght, message}) do

  if message_lenght != String.length(message) do
    IO.puts("Stated lenght of message is wrong")
  else
    IO.gets(message)
    GenServer.call(@server, {:send_message_to_queue, name_of_queue, message})
  end

  end

  def receive_messages() do

    received_message = spawn(fn -> receive_message() end)
  end

  def receive_message() do
  receive do
    {message_lenght, message} -> received_message = message
  end
  end

end
