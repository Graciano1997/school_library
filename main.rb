require_relative 'logic/userinterface'
require_relative 'logic/app'

class Main
  def main
    app = App.new
    library = UserInterface.new
    loop do
      library.show
      app.call(library.option) if (1..7).include?(library.option)
      break if library.option == 7
    end
  end
end

mainlibrary = Main.new
mainlibrary.main
