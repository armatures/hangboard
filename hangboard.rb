
class Hangboard
  def initialize
    @waiter = Waiter.new
  end

  def one_rep
    puts 'rest'
      countdown(5)

    puts 'deadhang'
    countdown(10)
  end

  def countdown(seconds)
    (0..seconds).each do |i|
      clear_terminal_line
      print "#{seconds - i}\r"
      @waiter.wait
    end
  end

  def clear_terminal_line
    print " "*80 + "\r"
  end

  def one_hold
    6.times do |i|
      puts "starting rep #{i}"
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

#Hangboard.new.workout
