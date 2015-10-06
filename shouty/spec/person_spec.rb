require 'shouty'

describe Person do
  let(:network) { double.as_null_object }
  it "subscribe to the network when created" do
    expect(network).to receive(:subscribe).with(an_instance_of(Person))
    Person.new(network)
  end

  it "broadasts shouts using the network" do
    sean = Person.new(network, 30)
    message = "Free Bagels!"

    expect(network).to receive(:broadcast).with(message, sean.location)

    sean.shout(message)
  end

  it "records messages heard" do
    lucy = Person.new(network)
    message = "Free Bagels!"
    lucy.hear(message)

    expect(lucy.messages_heard).to include(message)
  end
  
  it "cannot send a message of more than 30 characters" do
    sean = Person.new(network, 30)
    message = "Free Bagels! Free Bagels! Free Bagels! Free Bagels!"

    expect(network).not_to receive(:broadcast)

    sean.shout(message)
  end
end
