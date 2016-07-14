include DataMagic

module TestData

   def self.driver_portal_login_details
     DataMagic.yml_directory ="#{Dir.getwd}"
     DataMagic.load('config/data/data.yml')
     data = data_for(:driver_portal_login_details)
   end


  def self.create_order
    DataMagic.yml_directory ="#{Dir.getwd}"
    DataMagic.load('config/data/data.yml')
    data = data_for(:create_new_order)
  end

  def self.management_site_credentials
    DataMagic.yml_directory = "#{Dir.getwd}"
    DataMagic.load('config/data/data.yml')
    data = data_for(:management_site_credentials)
  end

   def self.create_dispatcher
     DataMagic.yml_directory = "#{Dir.getwd}"
     DataMagic.load('config/data/data.yml')
     data = data_for(:create_dispatch_user)
   end

  def self.dp_invalid_credentials
    DataMagic.yml_directory = "#{Dir.getwd}"
    DataMagic.load('config/data/data.yml')
    data = data_for(:driver_portal_invalid_login_details);
  end

   def self.edit_vehicle_informations
     DataMagic.yml_directory = "#{Dir.getwd}"
     DataMagic.load('config/data/data.yml')
     data = data_for(:edit_vehicle_informations);
   end

end
