defmodule GenServerBroker.Server do
  use GenServer, restart: :transient


  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
    end

  def init(%{}) do
    IO.puts("Server is initialized")

    {:ok, %{}}

end

#Тут обработчик запроса от клиента на создание очереди
def handle_call({:create_queue, queue_name}, _from, state) do

  {:ok, pid} = Queue.new(to_atom(queue_name))

  {:reply, "You have successfully created a queue named #{queue_name} with PID of #{pid}", state}

end

def handle_call({:subscribe_to_queue, queue_name, receiver_pid}, _form, state) do

  {:ok, pid} = Queue.push(to_atom(queue_name), receiver_pid)

  {:reply, "You have successfully subscribed to queue named #{queue_name} with PID of #{pid}", state}

end

handle_call({:send_message_to_queue, queue_name, message}, _from, state) do
  receiver_pid = Queue.pop(to_atom(queue_name))
  send(receiver_pid, message)
  Queue.push(to_atom(queue_name), reciever_pid)

  {:reply, "You have successfully sended message to the first reciever in #{queue_name}", state}

end


end
