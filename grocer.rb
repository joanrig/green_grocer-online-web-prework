"require pry"

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
#   {"AVOCADO" => {:price => 3.0, :clearance => true, :count => 1},
#   "AVOCADO W/COUPON" => {:price => 5.0, :clearance => true, :count => 1},



def apply_coupons(cart, coupons)
  cart.each do |food|
    coupons.each do |coupon, item|
    
 #base case
 #is there a coupon for item in cart?; 
 #did buyer purchase at least min required for coupon price?
      if food == item && food[:count] >= coupon[:num]
        
 #reduce food count by number affected by coupon       
        food[:count] = food[:count] - coupon[:num]
      
        
 #if there is already a couponed item in cart, add 'count' and increment
        if cart.has_key?("#{food} W/COUPON")
          cart["#{food} W/COUPON"][:count] += 1
            
  #otherwise, add that couponed item to cart
        else 
          cart[food] = "#{food} W/COUPON"
          cart["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => food[:clearance], :count => 1}
        end
      end
    end
  end
  cart
  #binding.pry
end
  
        


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
