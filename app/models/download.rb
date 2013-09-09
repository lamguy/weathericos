class Download < ActiveRecord::Base

	attr_accessor :authenticated_url

	def authenticated_url
		file_name 		= 'weathericos.zip'
		bucket			= 'weathericos'

		s3 = AWS::S3.new

		object = s3.buckets[bucket].objects[file_name]
		file_url = object.url_for(:read, :respond_content_type => "application/zip", :expires => 10).to_s
	end
end
