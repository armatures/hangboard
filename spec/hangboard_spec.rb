require_relative '../hangboard'
require 'rspec'

describe Hangboard do
  describe "workout" do
    let(:sayer){object_double(Sayer.new, :say => true)}
   it "counts down" do
    setup

    expect(subject).to receive(:one_rep).exactly(6).times
    subject.one_hold
   end

   it "counts down the last three numbers of each countdown" do
    setup

    expect(sayer).to receive(:say).exactly(3*2).times
    subject.one_rep
   end

   it "counts down, not up" do
    setup

    expect(sayer).to receive(:say).with(1).exactly(2).times
    subject.one_rep
   end

   def setup
    waiter = object_double(Waiter.new, :wait => true)
    allow(Waiter).to receive(:new).and_return(waiter)
    allow(Sayer).to receive(:new).and_return(sayer)
   end
  end
end
