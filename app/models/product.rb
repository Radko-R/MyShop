class Product < ApplicationRecord
  belongs_to :shop
  has_many :variants, dependent: :destroy
  has_many :line_items
  has_many :carts, through: :line_items

  validates :title, presence: true
  validates :handle, presence: true, uniqueness: true

  def self.products_top
    sql = <<~SQL
      select products.id as product_id, products.title as title, count(line_items.id) as current_count from products
      left join line_items ON line_items.product_id = products.id
      GROUP by products.id
      ORDER BY current_count DESC
    SQL
    ActiveRecord::Base.connection.exec_query(sql).to_a
  end

  # def self.popular_products
  #   popular = <<~SQL
  #   select products.id as product_id, products.title as title, count(line_items.id) as current_count from products
  #   inner join line_items ON line_items.product_id = products.id
  #   GROUP by products.id
  #   ORDER BY current_count DESC
  #   LIMIT 10;
  #   SQL
  #
  #   @popular_products = ActiveRecord::Base.connection.exec_query(popular).to_a
  # end
  #
  # def self.unpopular_products
  #   unpopular = <<~SQL
  #   select products.id as product_id, products.title as title, count(line_items.id) as current_count from products
  #   left join line_items ON line_items.product_id = products.id
  #   GROUP by products.id
  #   ORDER BY current_count ASC
  #   LIMIT 10;
  #   SQL
  #
  #   @unpopular_products = ActiveRecord::Base.connection.exec_query(unpopular).to_a
  # end
end


