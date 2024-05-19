class Product < ApplicationRecord
	validates :name, uniqueness: { scope: :brand }
	validates :code, uniqueness: true

	scope :search, ->(query) { where(name: query).or(where(code: query)).or(where(brand: query)).or(where(category: query)) if query.present? }

  def self.product_search_list
    Product.all.map { |p| ["#{p.name} # #{p.brand} # #{p.code}", p.id] }
  end

  def color_highlighter
    if self.quantity < 2
      "red"
    elsif self.quantity < 6
      "yellow"
    end
  end
end
