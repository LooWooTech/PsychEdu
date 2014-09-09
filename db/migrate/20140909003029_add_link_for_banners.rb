class AddLinkForBanners < ActiveRecord::Migration
  def change
    add_column :settings, :forum_banner_link, :string
    add_column :banner_images, :link, :string
    add_column :topics, :cover_link, :string
  end
end
