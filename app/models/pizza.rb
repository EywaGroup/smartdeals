class Pizza < ActiveRecord::Base
	has_many :ingredients
	accepts_nested_attributes_for :ingredients,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true

  																accepts_nested_attributes_for :ingredients,
  															reject_if: proc { |attributes| attributes['price'].blank? },
  															allow_destroy: true

  																accepts_nested_attributes_for :ingredients,
  															reject_if: proc { |attributes| attributes['vendor_number'].blank? },
  															allow_destroy: true
  															
	has_attached_file :image, styles: { :medium => "400x400#" }
  validates :title, :description, :image, presence: true
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
