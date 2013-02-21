class Parent < ActiveRecord::Base
  attr_accessible :name
  has_many :autosaveChildren, :class_name => "Child::AutosaveChild", :autosave => true
  has_many :notAutosaveChildren, :class_name => "Child::NotAutosaveChild", :autosave => false
  has_many :defaultChildren, :class_name => "Child::DefaultChild"
end
