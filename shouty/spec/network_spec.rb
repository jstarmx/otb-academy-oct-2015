require 'shouty'
RSpec.describe Network do
  it "broadcast messages to all subscribers within 50m" do
    network = Network.new

    lucy = double("lucy", location: 10)
    pam = double("pam", location: 40)
    sally = double("sally", location: 60)

    network.subscribe(lucy)
    network.subscribe(pam)

    message = "Free Toast!"

    expect(lucy).to receive(:hear).with(message)
    expect(pam).to receive(:hear).with(message)
    expect(sally).not_to receive(:hear).with(message)

    network.broadcast(message, 0)
  end
end
