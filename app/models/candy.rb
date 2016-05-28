class Candy < ActiveRecord::Base
  # Enum, a special data type, allows access to a hash of static values \
  # that is available on the calls itself.
  # For example, calling:
  #     Candy.types['kit_kat'] => 0 (index of of the key/value pair)
  # It also allows us to perform operations such as #include?:
  #     Candy.types.include?('kit_kat')
  enum types: [:kit_kat, :skittles, :m_and_ms, :hersheys_kiss,\
               :butterfinger, :gummy_bear, :twizzler]
end
