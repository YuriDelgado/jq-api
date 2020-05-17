json.item do
  json.quantity item.quantity
  json.subtotal item.subtotal
  json.tax item.tax
  json.total item.total
  json.product item.product, :id, :name, :description, :price
end