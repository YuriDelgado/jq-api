json.order do
  json.info @order.info
  json.total @order.total
  json.items @order.items, partial: 'items/item', as: :item
end
