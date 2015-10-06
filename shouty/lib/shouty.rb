class Person
  attr_reader :location
  
  def initialize(network, location = 0)
    @network = network
    @network.subscribe(self)
    @location = location
    @messages_heard = []
  end

  def move_to(location)
    @location = location.to_f
  end

  def shout(message)
    @network.broadcast(message, @location)
    self
  end

  def hear(message)
    @messages_heard << message
  end

  def messages_heard
    @messages_heard
  end
end

class Network
  def initialize
    @subscribers = []
  end

  def subscribe(subscriber)
    @subscribers << subscriber
    self
  end

  def broadcast(message, location)
    @subscribers.each do |subscriber|
      if (subscriber.location - location).abs < 50
        subscriber.hear(message)
      end
    end
  end
end
