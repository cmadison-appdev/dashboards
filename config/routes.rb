Rails.application.routes.draw do
# get("/", { :controller =>  "currencies", :action =>  "home_page" })
get("/forex", { :controller =>  "currencies", :action =>  "first_currency" })
get("/forex/:Currency", {:controller => "currencies", :action => "curr_sym"})
get("/forex/:Currency/:Currency2", {:controller => "currencies", :action => "curr_sym2"})

end
