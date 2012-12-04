#encoding: utf-8
class Client < ActiveRecord::Base
  attr_accessible :email, :name, :smsmail, :group_ids

  has_and_belongs_to_many :groups

  HUMANIZED_ATTRIBUTES = {
  	:email => "Электронный адрес",
  	:name => "Имя клиента",
  	:smsmail => "Сотовый телефон"
  }
  def self.human_attribute_name(attr, options={})
	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  validates :name, 	:presence => true,
  					:length   => { :maximum => 250 }

 email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
 validates :email, :presence => {:message => "не указан."},
  						:format   => { :with => email_regex, :message => "не соответствует формату." },
                  :allow_nil => true, :if => :email?


  smsmail_regex = /^7[0-9]{10}$/i
  validates :smsmail,  	:presence => {:message => "не указан."},
  						:format   => { :with => smsmail_regex, :message => "не соответствует формату 79991112233." },
                  :allow_nil => true, :if => :smsmail?
end
