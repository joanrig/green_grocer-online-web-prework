require "pry"

# {"AVOCADO" => {:price => 3.00, :clearance => true}},
# {"KALE" => {:price => 3.00, :clearance => false}},
# {"BLACK_BEANS" => {:price => 2.50, :clearance => false}}
# {"AVOCADO" => {:price => 3.00, :clearance => true}},

def consolidate_cart(cart)
  merged = {}
    cart.each do |food_hash|
      food_hash.each do |name, price_hash|
        if !merged.has_key?(name)
          merged[name] = price_hash.merge({:count => 1})
        else
          merged[name][:count] += 1
        end
      end
    end
  merged
  #binding.pry
end


# cart food format: 
#{"AVOCADO" => {:price => 3.00, :clearance => true, :count => 3}}


# coupons format: --------
# {:item => "AVOCADO", :num => 2, :cost => 5.00},

#desired outcome for couponed item:
#   {"AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
#   "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},
#{"AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},

# coupons hash: 
# {:item => "AVOCADO", :num => 2, :cost => 5.00},
# {:item => "BEER", :num => 2, :cost => 20.00},
# {:item => "CHEESE", :num => 3, :cost => 15.00}


def apply_coupons(cart, coupons)
    coupons.each do |coupon|
    food = coupon[:item] 
      if cart[food] && cart[food][:count] >= coupon[:num]
        cart[food][:count] -= coupon[:num]
        
        food2 = "#{food} W/COUPON"
        if cart[food2]
          cart[food2][:count] += 1
        else 
          cart[food2] = nil
          cart[food2] = {:price => coupon[:cost], :clearance => food[:clearance], :count => 1}
        end
      end
    end
  cart
  binding.pry
end


 
  
        


# def apply_clearance(cart)
#   cart.each do |food, food_info|
#     if food[:clearace] == true
#       food[:price] = ((food[:price] * (0.8)).round(3)
# end

# def checkout(cart, coupons)
#   # code here
# end
