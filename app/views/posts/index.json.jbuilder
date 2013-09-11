json.array!(@posts) do |post|
  json.extract! post, :title, :description, :skills, :user_id, :expire_by, :start_date, :duration, :report_time, :maximum_bid
  json.url post_url(post, format: :json)
end