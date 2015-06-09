namespace :export do
  desc "Export user data into csv"
  require 'csv'
  task user_data: :environment do
    CSV.open("user_data_#{Time.current.to_s}.csv", "w") do |csv|
      @users = User.all
      export_columns = %w(id name email created_at slug)
      csv << export_columns
      @users.each do |user|
        csv << [user.id, user.name, user.email, user.created_at, user.slug]
      end
    end
  end

end
