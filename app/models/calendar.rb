class Calendar < ActiveRecord::Base

has_many :id_harcerza
accepts_nested_attributes_for :id_harcerza

end
