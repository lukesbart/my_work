# Create an empty hash
hash = {}

#Open logins.txt, for each line get value and key seperated by space
File.open('logins.txt') do |fp|
  fp.each do |line|
    key, value = line.chomp.split(" ")
    hash[key] = value
  end
end

# Gets username
puts "Enter your username"
user = $stdin.gets.chomp

# Gets password
puts "\n", "Enter your password"
password = $stdin.gets.chomp

#Check if has has the key of user var
if hash.has_key?(user)
  # Check if user has value of password
  if hash[user] == password
    puts "\n", "Welcome #{user}!"
  else
    puts "\n", "Wrong password"
  end
else
    puts "\n", "Wrong username"
end

if user == "admin"
  if hash[user] == password
    puts "Would you like to add a new user?"
    $stdin.gets.chomp
    print "Username:", "\n"
    new_user = $stdin.gets.chomp

    print "Password:", "\n"
    new_password = $stdin.gets.chomp

    puts "Your new user is: #{new_user}, with Password #{new_password}"
    print "ok (y/n): "
    confirm = $stdin.gets.chomp
    if confirm == 'y'
      fail_write = File.open('logins.txt', 'a+') #{ |file| file.write("\n", "failed") }
      fail_write.write("\n")
      fail_write.write("#{new_user} #{new_password}")
    else
    puts "Ok, not added."
    end
  end
end
