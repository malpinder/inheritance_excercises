require 'spec_helper'
require './life/grass_skink'

describe GrassSkink do

  it "breathes" do
    subject.breathes?.should be_true
  end

  it "moves about" do
    subject.moves?.should be_true
  end

  it "eats" do
    subject.eats?.should be_true
  end

  it "is covered in scales" do
    subject.covering.should eq :scales
  end

  it "is cold blooded" do
    subject.blood_temperature.should eq :cold
  end

  it "reproduces by giving birth" do
    subject.reproduces_by.should eq :giving_birth
  end

  it "moves about by walking" do
    subject.locomotion_method.should eq :walking
  end

end
