require_relative './app'
def main
  puts 'Welcome to School Library App'
  app = App.new
  app.select_from_main
end
main
