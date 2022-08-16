class UsersLoaderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    last_fetched = User.maximum(:provider_id) || 0
    users = UserService.fetch(last_fetched)

    if users
      users.each do |user|
        new_user = User.create!(first_name: user[:first_name], last_name: user[:last_name],
                    email: user[:email], status: user[:status], provider_id: user[:id])
        p "User created with #{new_user.id}"
      end
    end
  end
end
