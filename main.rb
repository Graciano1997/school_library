require_relative 'libraryui'

class Main < Libraryui
  def main
    libraryItem = Libraryui.new
    libraryItem.start()
  end
end
