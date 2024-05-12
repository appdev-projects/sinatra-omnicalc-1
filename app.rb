require "sinatra"
require "sinatra/reloader"

# Square form
get "/square/new" do
  erb :square_form
end

post "/square/result" do
  num = params[:number].to_f
  @result = num * num
  erb :square_result
end

# Square Root form
get "/square_root/new" do
  erb :square_root_form
end

post "/square_root/result" do
  num = params[:number].to_f
  @result = Math.sqrt(num)
  erb :square_root_result
end

# Random Number form
get "/random/new" do
  erb :random_form
end

post "/random/result" do
  min = params[:min].to_i
  max = params[:max].to_i
  @result = rand(min..max)
  erb :random_result
end

# Payment form
get "/payment/new" do
  erb :payment_form
end

post "/payment/result" do
  apr = params[:apr].to_f / 100 / 12
  n = params[:years].to_i * 12
  pv = params[:present_value].to_f
  
  numerator = apr * pv
  denominator = 1 - (1 + apr) ** -n
  @payment = (numerator / denominator).round(2)
  @interest_rate = (apr * 12 * 100).round(4)
  
  erb :payment_result
end
