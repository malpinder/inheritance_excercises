require 'spec_helper'
require './boxes/magic_box'

describe MagicBox do

  let(:biscuit) { "biscuit" }

  describe "#shake" do
    describe "when it is empty" do
      it "returns nil" do
        subject.shake.should be_nil
      end
      it "leaves the box empty" do
        subject.shake
        subject.should be_empty
      end
    end
    describe "when it contains something" do
      subject do
        box = MagicBox.new
        box.store(biscuit)
        box
      end
      it "returns '*kaPHWOOSH*'" do
        subject.shake.should eq '*kaPHWOOSH*'
      end
      it "changes the contents of the box to a rabbit" do
        subject.shake
        contents = subject.retrieve
        contents.should eq "rabbit"
      end
    end
  end

end
