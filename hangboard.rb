class Hangboard
  def initialize
    @waiter = Waiter.new
    @reporter = Reporter.new
  end

  def workout(holds: 9)
    holds.times do |i|
      rest_between_holds if i > 0
      puts "starting hold #{i}"
      one_hold
    end
  end

  def one_rep
    puts "\rrest"
      countdown(5)

    puts "\rdeadhang"
    countdown(10)
  end

  def countdown(seconds)
    seconds.downto(1) do |i|
      clear_terminal_line
      print "\r#{i}"
      @reporter.say i if i <= 3
      @waiter.wait
    end
  end

  def one_hold
    6.times do |i|
      puts "\rstarting rep #{i}"
      one_rep
    end
  end

  def clear_terminal_line
    print "\r" + " " * 80
  end

  def rest_between_holds
    @waiter.rest
  end
end

class Waiter
  def wait
    sleep 1
  end

  def rest
    sleep 3*60
  end
end

class Reporter
  def say(phrase)
    Thread.new{ `say #{phrase}`}
  end
end
