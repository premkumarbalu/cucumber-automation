include DataMagic

module TestData
  def self.customer
      DataMagic.yml_directory ="#{Dir.getwd}"
      DataMagic.load('config/strings.yml')
      data = data_for(:my_random_data)
    end
end
