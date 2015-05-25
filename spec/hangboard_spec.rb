require_relative '../hangboard'
require 'rspec'

describe Hangboard do
  describe "workout" do
   it "counts down" do
    waiter = object_double(Waiter.new, :wait => true)
    allow(Waiter).to receive(:new).and_return(waiter)

    expect(waiter).to receive(:wait)
    Hangboard.new.workout
   end
  end
end
