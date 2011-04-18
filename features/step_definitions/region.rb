Допустим /^в сервисе есть geo$/ do
  YAML::load_file("db/default/countries.yml").each {|key, value|
    country = Country.create("name"=> value.name, "iso_name"=> value.iso_name, "iso"=> value.iso, "iso3"=> value.iso, "numcode"=> value.numcode)
    puts country.error.inspect unless country.error.blank?
  }
  puts "11111111111111111111"
  puts Country.all.inspect

  russia = Country.find_by_iso("RU")
  Region.create(:name => "Москва", :country_id => russia)
  Region.create(:name => "Екатеринбург", :country_id => russia.id)
  Region.create(:name => "Красноярск", :country_id => russia.id)
  Region.create(:name => "Оренбург", :country_id => russia.id)
  Region.create(:name => "Тюмень", :country_id => russia.id)
  Region.create(:name => "Санкт-Петербург", :country_id => russia.id)
  Region.create(:name => "Иркутск", :country_id => russia.id)
  Region.create(:name => "Нижний Новгород", :country_id => russia.id)
  Region.create(:name => "Пермь", :country_id => russia.id)
  Region.create(:name => "Ульяновск", :country_id => russia.id)
  Region.create(:name => "Барнаул", :country_id => russia.id)
  Region.create(:name => "Казань", :country_id => russia.id)
  Region.create(:name => "Новокузнецк", :country_id => russia.id)
  Region.create(:name => "Ростов-на-Дону", :country_id => russia.id)
  Region.create(:name => "Уфа", :country_id => russia.id)
  Region.create(:name => "Волгоград", :country_id => russia.id)
  Region.create(:name => "Кемерово", :country_id => russia.id)
  Region.create(:name => "Новосибирск", :country_id => russia.id)
  Region.create(:name => "Самара", :country_id => russia.id)
  Region.create(:name => "Челябинск", :country_id => russia.id)
  Region.create(:name => "Воронеж", :country_id => russia.id)
  Region.create(:name => "Краснодар", :country_id => russia.id)
  Region.create(:name => "Омск", :country_id => russia.id)
  Region.create(:name => "Саратов", :country_id => russia.id)
  Region.create(:name => "Ярославль", :country_id => russia.id)

  ua = Country.find_by_iso("UA")
  Region.create(:name => "Киев", :country_id => ua.id)
  Region.create(:name => "Днепропетровск", :country_id => ua.id)
  Region.create(:name => "Донецк", :country_id => ua.id)
  Region.create(:name => "Львов", :country_id => ua.id)
  Region.create(:name => "Одесса", :country_id => ua.id)
  Region.create(:name => "Харьков", :country_id => ua.id)
end