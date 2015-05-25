require_relative '../hangboard'
require 'rspec'

describe Hangboard do
  describe "workout" do
    let(:reporter){object_double(Reporter.new, say: true, report: true, puts: true)}
    let(:waiter){ object_double(Waiter.new, wait: true, rest_between_holds: true) }

    it "demands 6 reps per hold" do
    setup

    expect(subject).to receive(:one_rep).exactly(6).times
    subject.one_hold
   end

   it "counts down the last three numbers of each countdown" do
    setup

    expect(reporter).to receive(:say).exactly(3*2).times
    subject.one_rep
   end

   it "counts down, not up" do
    setup

    expect(reporter).to receive(:say).with(1).exactly(2).times
    subject.one_rep
   end

   it "accepts an argument for the number of holds to hang on" do
     setup

     expect(subject).to receive(:one_hold).exactly(3).times
     subject.workout(holds: 3)
   end

   it "defaults the number of holds in a workout to 9" do
     setup

     expect(waiter).to receive(:rest_between_holds).exactly(8).times
     subject.workout
   end

   it "holds in a workout are separated by rests" do
     setup

     expect(waiter).to receive(:rest_between_holds).exactly(1).times
     subject.workout(holds:2)
   end

   def setup
    allow(Waiter).to receive(:new).and_return(waiter)
    allow(Reporter).to receive(:new).and_return(reporter)
   end
  end
end
