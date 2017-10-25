class Html

  DEFAULT_BROWSER = 'firefox.exe'

  def run file, args
    if args.nil? || args.empty?
      system "#{DEFAULT_BROWSER} #{file}"
    else
      dispatch_on_paramters file, args
    end
  end

  def dispatch_on_paramters file, args
    cmd = args
    send "do_#{cmd}", file, args
  end

  def do_chrome file, args=nil
    path = File.join(ENV['presentWorkingDir'], file)
    system "chrome.exe #{path}"
  end

  def do_edge file, args=nil
    system "edge #{file} #{args}"
  end

  def do_atom file, args=nil
    system "atom #{file}"
  end

end
