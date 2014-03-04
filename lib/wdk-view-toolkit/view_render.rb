require "tilt"
require "wdk-view-toolkit/js_partial/js"

class ViewRenderScope
  haml_files = File.join("component", "*.*")
  Dir.glob haml_files do |file|
    file_name = File.basename(file, File.extname(file))
    method_name = file_name[1, file_name.length].to_sym

    if(not self.respond_to? method_name)
      self.send :define_method, method_name do |args = {}|
        Tilt.new(file).render ViewRenderScope.new, args
      end
      puts "with component: #{method_name}"
    end
  end

  containers_files = File.join("component", "container", "*.*")
  Dir.glob containers_files do |file|
    file_name = File.basename(file, File.extname(file))
    method_name = file_name[1, file_name.length].to_sym
    if(not self.respond_to? method_name)
      self.send :define_method, method_name do |args = {}, &block|
        Tilt.new(file).render ViewRenderScope.new, args, &block
      end
      puts "with container: #{method_name}"
    end
  end
end

