require 'spec_helper'
require './life/animal'

describe Animal do

  it "breathes" do
    subject.breathes?.should be_true
  end

  it "moves about" do
    subject.moves?.should be_true
  end

  it "eats" do
    subject.eats?.should be_true
  end

end
