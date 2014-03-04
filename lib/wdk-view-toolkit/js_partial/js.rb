#js
class ViewRenderScope
  def base_js(file)
    is_base_file = file.include?( "application.js" ) || file.include?("routes.js")
    is_base_file
  end

  def include_js
    template_path = File.expand_path('../', __FILE__)
    template = ""
    js_files = File.join("js","**", "*.js")
    Dir.glob js_files do |file|
      if ! base_js file
        template += Tilt.new("#{template_path}/_js_script_tag.haml").render self,  {:js_file_path => file}
      end
    end
    template += Tilt.new("#{template_path}/_js_script_tag.haml").render self,  {:js_file_path => "js/application.js"}
    template += Tilt.new("#{template_path}/_js_script_tag.haml").render self,  {:js_file_path => "js/routes.js"}
    template
  end
end