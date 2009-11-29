require 'spec_helper'

describe HomeCheck do
  
  describe "on_date scope" do
    it "should only return home checks on the given date" do
      HomeCheck.make(:scheduled_at => "23:59 2009-11-25")
      home_check = HomeCheck.make(:scheduled_at => "12:00 2009-11-26")
      HomeCheck.make(:scheduled_at => "00:01 2009-11-27")
      HomeCheck.on_date("2009-11-26").should == [home_check]
    end
  end
  
  describe "scheduled_at_date" do
    it "should assign the date without changing the time" do
      home_check = HomeCheck.new
      home_check.scheduled_at = Time.zone.parse("10:37 2009-11-26")
      home_check.scheduled_at_date = "2009-11-27"
      home_check.scheduled_at.should == Time.zone.parse("10:37 2009-11-27")
    end
  end
  
  describe "scheduled_at_time" do
    it "should assign the time without changing the date" do
      home_check = HomeCheck.new
      home_check.scheduled_at = Time.zone.parse("10:37 2009-11-26")
      home_check.scheduled_at_time = "17:24"
      home_check.scheduled_at.should == Time.zone.parse("17:24 2009-11-26")
    end
  end

end
