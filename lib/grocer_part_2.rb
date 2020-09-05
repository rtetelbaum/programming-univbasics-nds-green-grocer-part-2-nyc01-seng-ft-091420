require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  coupon_cart = []
  cart.each do |item|
    coupons.each do |coupon_item|
      if item[:item] == coupon_item[:item]
        item[:count]  %% 
      end
    end
  end
  coupon_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
