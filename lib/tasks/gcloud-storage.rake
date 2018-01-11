# rake storage:sync_events
require "google/cloud/storage"

namespace :storage do
  desc "Test google storage"
  task :sync_events => :environment do

  	base_url = "https://storage.googleapis.com/sktv/"
  	puts "***"
	puts ENV['GCLOUD_APPLICATION_CREDENTIALS'].inspect
	storage = Google::Cloud::Storage.new(
		project_id: ENV["GCLOUD_PROJECT_ID"],
		credentials: StringIO.new(ENV["GCLOUD_APPLICATION_CREDENTIALS"])
	)
	bucket = storage.bucket ENV["GCLOUD_BUCKET"]

	Event.all.each do |event|
		if event.code_name
			event.photos.delete_all
			
			event_files = bucket.files prefix: "Eventos/#{event.code_name}"
		
			event_files.all.each do |file|
				file.acl.public!
				puts file.name
				Photo.create(photo_url: "#{base_url}#{file.name}", event_id: event.id)
			end
		end
	end
  end
end

