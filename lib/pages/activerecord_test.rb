=begin
require "rubygems"
require 'net/ssh'
require 'net/ssh/gateway'
require 'active_record'
require 'activerecord-jdbc-adapter'
require 'jdbc/mysql'


module TestingDb

  class Myclass < ActiveRecord::Base


    gateway = Net::SSH::Gateway.new('tst-recap.htcinc.com',
                                    'ec2-user',
                                    :password => 'recap',
                                    :keys => ['HTC-ReCAP-Server-Keys.pem'],
                                    :verbose => :debug)


    #puts "true" if gateway.active?
    port = gateway.open('127.0.0.1',3306,3307)

    #config = Database::Configuration.for_environment(:sitedb)
    db_info = YAML::load_file("config/sitedb.yml")
    db_info['production']

    if defined? JRUBY_VERSION
      #require 'jdbc/mysql'
      Jdbc::MySQL.load_driver
    end

    url = "jdbc:mysql://#{db_info['host']}:#{db_info['port']}/#{db_info['db_name']}"

    #Log.instance.debug "Connecting to site database at #{url} with #{config['username']}/#{config['password']} credentials"
    db_config = {
        adapter:  'jdbc',
        driver:   'com.mysql.jdbc.Driver',
        url:      url,
        username: db_info['username'],
        password: db_info['password'],
        port:db_info['port'],
        connection_alive_sql: true,
        uncommitted_read: true

    }

    p establish_connection(db_config)

  end
end
=end