class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true   

  def self.search(query)
    text_shout_ids = TextShout.where("body ILIKE ?", "%#{@query}%").map(&:id)
    where(id: text_shout_ids)
  end
end
