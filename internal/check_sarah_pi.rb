data_file = File.expand_path(File.dirname(__FILE__)) + '/data/sarah_pi.txt'
if File.exist? data_file
  # Update something with sensor data
  File.delete data_file
  puts "Sarah's Pi checked in!"
else
  puts 'Emailing Sarah!'
  MyMailer.sarah_pi_down.deliver
end