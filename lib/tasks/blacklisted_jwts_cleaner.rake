# frozen_string_literal: true

namespace :blacklisted_jwts_cleaner do
  desc 'Will remove all blacklisted jwts up to todays date'

  task remove_old: :environment do
    puts 'Removing old elements'
    deleted_count = JwtBlacklist.old_blacklisted_jwts.delete_all
    puts "#{deleted_count} elements removed."
  end
end
