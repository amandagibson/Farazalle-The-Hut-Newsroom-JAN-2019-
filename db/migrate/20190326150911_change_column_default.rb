class ChangeColumnDefault < ActiveRecord::Migration[5.2]
	def change
		change_column :articles, :image, :string, default: 'https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg'
  end
end
