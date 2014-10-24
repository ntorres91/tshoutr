class MakeShoutsPolymorphic < ActiveRecord::Migration

  class Shout < ActiveRecord::Base
  end

  class TextShout < ActiveRecord::Base
  end

  def change
    add_column :shouts, :content_type, :string
    add_column :shouts, :content_id, :integer

    reversible do |dir|
      dir.up do 
        Shout.find_each do |shout|
          text_shout = TextShout.create!(body: shout.content)
          shout.update!(content_type: "TextShout", content_id: text_shout.id)
        end
      end 

      dir.down do 
        Shout.find_each do |shout|
          text_shout = TextShout.find(shout.content_id)
          shout.update(content: text_shout.body)
          text_shout.destroy
        end
      end
    end 

    remove_column :shouts, :content, :string 
  end
end




