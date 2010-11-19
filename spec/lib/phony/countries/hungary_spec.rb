require 'spec_helper'

describe Phony::Countries::Hungary do
  
  before(:each) do
    @hungary = Phony::Countries::Hungary
  end
  
  describe "split" do
    it "should handle Budapest" do
      @hungary.split('12345678').should == ['1', '234', '5678']
    end
    it "should handle Cologne" do
      @hungary.split('22123456').should == ['22', '123', '456']
    end
  end
  
end