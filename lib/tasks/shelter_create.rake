namespace :video_positon_update do
  desc "Add defalut position of 0 to all nil positions."

  def log(msg)
   puts msg
   Rails.logger.info(msg)
  end

  task default_positons_0: :environment do
    log("Starting task to create shelters database.")

    start_time = Time.now
    successful_records = 0
    skipped_records = 0
    failed_records = 0
    shelters = Shelter.all

    shelters.each do |shelter|
      if shelter.name.present?
        skipped_records += 1
        log("Skipping shelter #{shelter.id}: shelter already exists.")
        next
      end

      if shelter.name.present? == false
        shelter.update_attribute :position, 0
        successful_records += 1
        log("Successfully updated video #{video.id}")
      else
        failed_records += 1
        log("Failed to update video #{video.id}")
      end
    end

    log("Task completed in #{Time.now - start_time} seconds. Out of #{videos.count} total videos, #{successful_records} videos updated successfully; #{skipped_records} videos skipped; #{failed_records} shifts failed.")
  end
end
