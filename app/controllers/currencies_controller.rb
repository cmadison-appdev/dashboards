class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    render({:template => "currency_templates/step_one.html.erb"})
  end
  def curr_sym
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    @curr_symb = params.fetch(:Currency)
    render({:template => "currency_templates/step_two.html.erb"})
  end
  def curr_sym2
    @curr_symb = params.fetch(:Currency)
    @curr_symb2 = params.fetch(:Currency2)
    @raw_data = open("https://api.exchangerate.host/convert?from=#{@curr_symb}&to=#{@curr_symb2}").read
    @parsed_data = JSON.parse(@raw_data)
    @result = @parsed_data.fetch("result")
    
    render({:template => "currency_templates/step_three.html.erb"})
  end
end 