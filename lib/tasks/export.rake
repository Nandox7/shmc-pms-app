namespace :export do
  desc "Ouputs User.all and Profile.all in a seeds.rb."
  task :seeds_format => :environment do
    User.order(:id).all.each do |user|
      puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['created_at','updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
		end

		Profile.order(:id).all.each do |profile|
			puts "Profile.create(#{profile.serializable_hash.delete_if {|key, value| ['created_at', 'updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end
