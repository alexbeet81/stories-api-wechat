json.extract! @story, :id, :name, :text, :image_url

json.comments @story.comments do |comment|
  json.extract! comment, :id, :name, :content, :story_id
  json.date comment.created_at.strftime("%A, %b %d")
end
