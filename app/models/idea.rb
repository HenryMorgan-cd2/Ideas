class Idea < ApplicationRecord
  belongs_to :category
  has_many :resources, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, :category, presence: true

  accepts_nested_attributes_for :resources, allow_destroy: true

  ransack_alias :search, :name_or_body_cont

  def tag_list= tag_list
    tags.delete_all
    tag_list.split(',').each do |tag|
      tag = tag.strip
      tags << Tag.find_or_create_by(name: tag)
    end
  end

  def tag_list
    tags.pluck(:name).join(', ')
  end

  def new_resources= val
    Array(val).each do |file|
      resources.build(file: file)
    end
  end

end
