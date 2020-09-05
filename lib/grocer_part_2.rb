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
  checkout_cart = consolidate_cart(cart).apply_clearance
  
end
