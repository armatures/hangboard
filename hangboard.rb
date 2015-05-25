class Hangboard
  def initialize
    @waiter = Waiter.new
    @sayer = Sayer.new
  end

  def one_rep
    puts "\rrest"
      countdown(5)

    puts "\rdeadhang"
    countdown(10)
  end

  def countdown(seconds)
    seconds.downto(0) do |i|
      clear_terminal_line
      print "\r#{i}"
      @sayer.say i if i < 3
      @waiter.wait
    end
  end

  def clear_terminal_line
    print "\r" + " " * 80
  end

  def one_hold
    6.times do |i|
      puts "\rstarting rep #{i}"
      one_rep
    end
  end

  def workout
    one_hold
  end
end

class Waiter
  def wait
    sleep 1
  end
end

class Sayer
  def say(phrase)
    `say #{phrase}`
  end
end
