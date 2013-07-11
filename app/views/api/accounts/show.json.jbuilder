json.hash_id @account.hash_id

json.groups @account.groups.order('position asc') do |json, group|
  json.id group.id
  json.title group.title
  json.hash_id group.hash_id

  json.pages group.pages do |json, page|
    json.url page.url
  end
end
