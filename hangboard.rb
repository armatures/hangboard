
class Hangboard

  def one_rep
    puts 'rest'
    (0..5).each do |i|
      print "#{5 - i}\r"
      sleep 1
    end

    puts 'deadhang'
    (0..10).each do |i|
      print "#{10 - i}\r"
      sleep 1
    end
  end
end

Hangboard.new.one_rep
