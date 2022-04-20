require_relative './app'
def main
  puts 'Welcome to School Library App'
  loop do
    app = App.new
    app.main_menue
    num = gets.chomp.chomp.to_i
    app.select_from_main(num)
  end
end
main
