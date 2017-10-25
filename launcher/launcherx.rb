require './launcher'

class Launcher

  def handler file
    get_handler(file) || build_handler(file)
  end

  def build_handler file
    handler = Class.new
    application = select_app file

    eval "def handler.run file, args=nil
      system '#{application} \#{file} \#{args}'
    end"
    handler
  end

  def get_handler file
    begin
      here = File.expand_path (File.dirname __FILE__ )
      ftype = file_type file
      print ftype
      require "#{here}/handlers/#{ftype}"
      Object.const_get( ftype.capitalize ).new
    rescue Exception
      print 'hit exception'
      nil
    end
  end

  def run file, args = nil
    handler(file).run file, args
  end

end
