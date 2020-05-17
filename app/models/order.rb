class Order < ApplicationRecord
  TAX_RATE = 16
  belongs_to :user
  has_many :items
  
  enum status: { draft: 0, active: 1, finished: 2 }

  def totals
    subtotal = items.sum(:subtotal)
    tax = subtotal * TAX_RATE / 100
    return [subtotal: subtotal.to_f, tax: tax.to_f, amount: (subtotal + tax).to_f]
  end
end
