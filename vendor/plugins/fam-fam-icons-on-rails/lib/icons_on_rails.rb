module IconsOnRails

  VERSION='0.1.0'

  def default_icon_set=( set )
    @default_icon_set = set
  end
  
  def default_icon_size=( size )
    @default_icon_size = size
  end 
    
  def default_icon_set
    @default_icon_set ||= 'fam-fam' # :aesthetica # :'fam-fam'
  end

  def default_icon_size
    @default_icon_size ||= 16 # 24 #16
  end

  # Insert an image tag with an icon with name equal to "name" param and
  # extension .png, with alt attribute and options.
  # Example:
  #    <%= icon :information, "Information icon", :border => 0 %>
  # will generate:
  #    <img src="../icons/information.png" alt="Information icon" border="0" />
  def icon(name, alt = nil, opts = {})
    opts[:border] = 0 unless opts[:border]
    opts[:align] = "bottom" unless opts[:align]
    opts[:alt] = alt
    set = opts.delete(:set) || default_icon_set
    size = opts.delete(:size) || default_icon_size
    image_tag "../icons/#{set}/#{size}/#{name}.png", opts
  end

  # Insert a image for submit the form.
  # Uses the same syntax of icon
  def icon_submit_tag(name, alt = nil, opts = {})
    opts[:alt] = alt
    set = opts.delete(:set) || default_icon_set
    size = opts.delete(:size) || default_icon_size
    image_submit_tag "../icons/#{set}/#{size}/#{name}.png", opts
  end


  def toggle_icon(name, alt = nil, *toggle_ids)
    icon name, alt, :onclick => toggle_ids.collect {|toggle_id| "$('#{toggle_id}').toggle()" }.join("; ")
  end

  def toggle_icon_with_text(name, text, alt = nil, *toggle_ids)
    apply_function_icon_with_text(name, text, "toggle", "new Effect.Highlight('#{toggle_ids[0]}')", alt, *toggle_ids)
  end

  def show_icon_with_text(name, text, alt = nil, *toggle_ids)
    extra_js = "$('#{toggle_ids[0]}').scrollTo(); "
    extra_js += "new Effect.Highlight('#{toggle_ids[0]}')"

    apply_function_icon_with_text(name, text, "show", extra_js, alt, *toggle_ids)
  end
  
  
  def apply_function_icon_with_text(name, text, function, extra_js = "", alt = nil, *toggle_ids)
    opts = toggle_ids.pop if toggle_ids.last.is_a?(Hash)
    extra_js ||= ""; extra_js = "; " + extra_js unless extra_js.blank?
    js = toggle_ids.collect {|toggle_id| "$('#{toggle_id}').#{function}()" }.join("; ") + extra_js
    
    content_tag :span, icon(name, alt, opts) + " " + text, :onclick => js
  end

  # offer up the preview of all icons for the current set
  def icon_preview(opts = {})
    set = opts.delete(:set) || default_icon_set
    image_tag "../icons/#{set}/preview_icons.png", opts
  end
  
end
