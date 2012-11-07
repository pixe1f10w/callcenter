require File.dirname(__FILE__) + '/../spec_helper'

describe Call do
  it "should be valid" do
    Call.new.should be_valid
  end
end
