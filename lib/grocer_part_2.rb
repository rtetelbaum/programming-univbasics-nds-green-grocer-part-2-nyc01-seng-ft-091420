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
  cart.each 
  clearance_cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
