require 'colored'

module Diagnostics
  module Tracer

    def self.watch_object(arg)
      if ENV['RACK_ENV'] == :development then
        if defined?(arg)

          classname = self.class.name

          methodname = caller[0][/`([^']*)'/, 1]
          tracer_sign = "@@ #{caller[0]} from <class:#{classname}>\<method:#{methodname}>"

          puts "Diagnostics::Tracer.watch_object <arg:#{arg}> -- #{tracer_sign}".green

          args = method(__method__).parameters.map { |arg| arg[1] }
          #puts "Method failed with " + args
          #puts "Method failed with " + args.map { |arg| "#{arg} = #{eval arg}" }.join(', ')
          #puts "tracer called with args -- " + args.map { |arg| "#{arg}" }.join(', ')

          tracer_check = ">>>>> status :: "
          if defined?(arg)
            tracer_check += "[define==T] "
          else
            tracer_check += "[define==F] "
          end

          if (arg.nil?)
            tracer_check += "[nil==T] "
          else
            tracer_check += "[nil==F] [ID==#{arg.object_id}] "
          end

          puts tracer_check
        end
      end
    end

    def self.raise_hand
      classname = self.class.name

      methodname = caller[0][/`([^']*)'/, 1]
      tracer_sign = "@@ #{caller[0]} from <class:#{classname}>\<method:#{methodname}>"

      puts "Diagnostics::Tracer.raise_hand <arg:#{arg}> -- #{tracer_sign}".green
    end

    def self.eval(exp)
      if ENV['RACK_ENV'] == :development then

        classname = self.class.name

        methodname = caller[0][/`([^']*)'/, 1]
        tracer_sign = "@@ #{caller[0]} from <class:#{classname}>\<method:#{methodname}>"

        puts "Diagnostics::Tracer.eval <arg:#{arg}> -- #{tracer_sign}".green

        #ToDo:: Sankar -- Implement evaluation method

      end
    end

  end

end