module ApplicationHelper

  # define google font tags for application
  # calling method need family name and styles
  def google_fonts_tag(family, styles)
  	tag('link', {
  		:rel => :stylesheet,
  		:type => Mime::CSS,
  		:href => "http://fonts.googleapis.com/css?family=#{family}:#{styles}"
  		}, false, false)
  end

end
