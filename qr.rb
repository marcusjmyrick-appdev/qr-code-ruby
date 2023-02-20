require "rqrcode"

puts "What kind of QR code would you like to generate?"
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message"
puts "4. to exit"
number = gets.chomp

num = number.to_i
if num == 4
  puts "Goodbye!"
end
while num != 4
  if num == 1
    puts "what is the URL"
    text = gets.chomp
  elsif num == 2
    puts "What is the name of the network"
    name = gets.chomp
    puts "What is the password"
    password = gets.chomp
    text = "WIFI:T:WPA;S:#{name};P:#{password};;"
  elsif num == 3
    puts "What is the phone number (no spaces)"
    n = gets.chomp
    nums = n.to_i
    puts "what is the message"
    message = gets.chomp
    text = "SMSTO:#{nums}:#{message}"
  end
  puts "what is the name for the file (do not include any spaces)"
  file = gets.chomp

  qrcode = RQRCode::QRCode.new(text)

  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })

  # Write the image data to a file
  IO.binwrite("#{file}.png", png.to_s)
end
