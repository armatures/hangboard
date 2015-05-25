require_relative '../hangboard'
require 'rspec'

describe Hangboard do
  describe "workout" do
   it "counts down" do
    subject = Hangboard.new
    waiter = object_double(Waiter.new, :wait => true)
    allow(Waiter).to receive(:new).and_return(waiter)

    expect(subject).to receive(:one_rep).exactly(6).times
    subject.one_hold
   end
  end
end
