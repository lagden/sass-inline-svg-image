require 'sass'
require 'base64'

module Sass::Script::Functions

  def inline_svg_image(path, color = nil, base64 = Sass::Script::Value::Bool.new(true))

    if color.is_a?(Sass::Script::Value::Bool)
      base64 = color
      color = nil
    end

    file = svg_file(path, color)

    if base64.to_bool
      data_url = "url('data:image/svg+xml;base64," + Base64.encode64(file) + "')"
    else
      data_url = "url('data:image/svg+xml;utf8," + URI::encode(file) + "')"
    end

    Sass::Script::String.new(data_url)
  end

  def svg_file(path, color=nil)
    if module_exists?('Compass')
      real_path = File.join(Compass.configuration.images_path, path.value)
    else
      real_path = File.join(Dir.pwd, path.value)
    end

    svg = data(real_path)

    unless color.nil?
      assert_type color, :Color, :color
      svg = svg.gsub!(/fill="#[0-9a-zA-Z]+"/, "fill=\"#{color}\"")
    end

    return svg
  end

  def data(real_path)
    if File.readable?(real_path)
      File.open(real_path, "rb") {|io| io.read}
    else
      raise Sass::SyntaxError, "File not found or cannot be read: #{real_path}"
    end
  end

  def module_exists?(name, base = self.class)
    base.const_defined?(name) && base.const_get(name).instance_of?(::Module)
  end

  private :data, :svg_file, :module_exists?

end
