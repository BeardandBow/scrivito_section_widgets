class SectionParallaxWidget < Widget
  attribute :section_content, :widgetlist
  attribute :background_image, :reference
  attribute :height, :string
  attribute :speed, :enum, values: ["fixed", "slow", "medium", "fast", "deactivate"], default: "medium"

  def section_class
    "parallax scrivito_section_parallax_widget section_speed_#{speed}"
  end

  def section_style
    styles = "height: #{height}; max-height: #{height};"
    styles += "background: url(#{background_image.binary_url}) top center #{'fixed' if speed=='fixed'} no-repeat; z-index: -1;" if !with_parallax? && background_image.present?
    return styles
  end

  def with_parallax?
    return true unless speed.present?
    ["slow", "medium", "fast"].include? speed
  end

  def parallax_speed
    # legacy support for widgets before speed option
    speed.presence || 'medium'
  end

  def column_size(image)
    self.container.column_size(image)
  end
end
