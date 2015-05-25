class Hangboard
  def initialize
    @waiter = Waiter.new
    @reporter = Reporter.new
  end

  def workout(holds: 9)
    holds.times do |i|
      @waiter.rest_between_holds(@reporter) if i > 0
      @reporter.puts "starting hold #{i}"
      one_hold
    end
  end

  def one_rep
    @reporter.report "rest"
      countdown(5)

      @reporter.report "deadhang"
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
      @reporter.puts "\rstarting rep #{i}"
      one_rep
    end
  end

  def clear_terminal_line
    print "\r" + " " * 80
  end
end

class Waiter
  def wait(seconds:1)
    sleep seconds
  end

  def rest_between_holds(reporter)
    sleep 2.5*60
    reporter.say 'thirty seconds rest remaining'
    sleep 30
  end
end

class Reporter
  def say(phrase)
    Thread.new{ `say #{phrase}`}
  end

  def report(phrase)
    puts "\r#{phrase}"
    say(phrase)
  end

  def puts(phrase)
    $stdout.puts phrase
  end
end
