class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :filename
      t.string :filetype
      t.string :fileformat
      t.integer :filesize
      t.string :dimensions
      t.text :content_description
      t.text :content_keywords
      t.datetime :file_date_created

      t.timestamps
    end
  end
end
