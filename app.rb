require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/payment/new") do
  erb(:new_payment_calc)
end


get("/square/results") do
  @the_num1 = params.fetch("users_number").to_f 

  @the_result1 = @the_num1 ** 2

  erb(:square_results)
end

get("/square_root/results") do
  @the_num2 = params.fetch("users_number").to_f 

  @the_result2 = @the_num2 ** 0.5

  erb(:square_root_results)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f 

  @max = params.fetch("user_max").to_f 

  @rand = rand(@min..@max)

  erb(:random_results)
end

get("/payment/results") do
  
  @apr = params.fetch("user_apr").to_f
  
  @years = params.fetch("user_years").to_i 
  
  @pv = params.fetch("user_pv").to_f

  @r = @apr / 100 / 12

  @n = @years * 12

  @payment = @pv * @r / (1 - (1 + @r) ** -@n)

  erb(:payment_results)
end
