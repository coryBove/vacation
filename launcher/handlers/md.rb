class Md

  DEFAULT_EDITOR = 'atom'

  def run file, args
    if args.nil? || args.empty?
      system "#{DEFAULT_EDITOR} #{file}"
    else
      dispatch_on_paramters file, args
    end
  end

  def dispatch_on_paramters file, args
    cmd = args
    send "do_#{cmd}", file, args
  end

  def do_atom file, args=nil
    system "atom #{file}"
  end

end
