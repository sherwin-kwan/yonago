# frozen_string_literal: true

class AddProductIdToSales < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :product, foreign_key: true
  end
end
