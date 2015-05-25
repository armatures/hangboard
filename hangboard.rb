
class Hangboard

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
      sleep 1
    end
  end

  def clear_terminal_line
    print " "*80 + "\r"
  end
end

Hangboard.new.one_rep
