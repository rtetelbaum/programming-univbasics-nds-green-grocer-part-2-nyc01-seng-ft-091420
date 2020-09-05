require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  coupon_cart = []
  cart.each do |item|
    coupons.each do |coupon_item|
      if item[:item] == coupon_item[:item]
        uncouponed = item[:count] % coupon_item[:num]
        couponed = item[:count] - uncouponed
        item[:count] = uncouponed
        coupon_price_per = coupon_item[:cost] / coupon_item[:num]
        coupon_cart << item
        coupon_cart << {:item => "#{item[:item]} W/COUPON", :price => coupon_price_per, :clearance => item[:clearance], :count => couponed}
      end
    end
    coupon_cart << item
  end
  coupon_cart
end

def apply_clearance(cart)
  clearance_cart = []
  cart.each do |item|
    if item[:clearance] == true
      clearance_price = item[:price] *= 0.8
      item[:price] = clearance_price.round(2)
      clearance_cart << item
    else
      clearance_cart << item
    end
  end
  clearance_cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(consolidated_cart, coupons)
  clearance_cart = apply_clearance(coupon_cart)
  sub_total = 0
  clearance_cart.each do |item|
    item_total_price = item[:price] * item[:count]
    sub_total += item_total_price
  end
  if sub_total > 100
    unrounded_total = sub_total * 0.9
    grand_total = unrounded_total.round(2)
  else
    grand_total = sub_total
  end
  binding.pry
end