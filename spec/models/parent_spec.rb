# rspec -fs -c spec/models/parent_spec.rb

require 'spec_helper'

describe Parent do

  before do
    @parent = Parent.create(:name => "parent")
    @autosave = @parent.autosaveChildren.build(:name => "autosave child")
    @not_autosave = @parent.notAutosaveChildren.build(:name => "not autosave child")
    @default = @parent.defaultChildren.build(:name => "default child")
    @parent.save
    @parent.reload
  end

  it "(:autosave => true) children saved" do
    @parent.autosaveChildren.size.should == 1
  end

  it "(:autosave => false) children not saved" do
    @parent.notAutosaveChildren.size.should == 0
  end

  it "default children saved" do
    @parent.defaultChildren.size.should == 1
  end

  describe "update" do

    before do
      @parent.notAutosaveChildren.create(:name => "not autosave child")
      @parent.autosaveChildren[0].name = "changed autosave child"
      @parent.notAutosaveChildren[0].name = "changed not autosave child"
      @parent.defaultChildren[0].name = "changed default child"
      @parent.save
      @parent.reload
    end

    it "(:autosave => true) children changed" do
      @parent.autosaveChildren[0].name.should == "changed autosave child"
    end

    it "(:autosave => false) children not changed" do
      @parent.notAutosaveChildren[0].name.should == "not autosave child"
    end

    it "default children not changed" do
      @parent.defaultChildren[0].name.should == "default child"
    end

  end

end
