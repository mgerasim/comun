#encoding: utf-8
class Group < ActiveRecord::Base
  attr_accessible :name, :client_ids

  has_and_belongs_to_many :clients

  HUMANIZED_ATTRIBUTES = {
  	:name => "Наименование"
  }
  def self.human_attribute_name(attr, options={})
	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  validates :name, 	:presence => true,
  					:length   => { :maximum => 250 }


end
