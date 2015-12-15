ARGV.each_with_index do |arg, index| 
    if index == 0
        nil
    else
        puts "#{ARGV[0]}, #{arg}!"
    end
end