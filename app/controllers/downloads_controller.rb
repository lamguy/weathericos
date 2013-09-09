class DownloadsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :free]
  def index
  	
  end

  def free
  	redirect_to 'http://cl.ly/image/0q1v2V3I1a43'
  end

  def pro
  	download = Download.new
  	redirect_to download.authenticated_url
  end
end
