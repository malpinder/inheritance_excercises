require 'spec_helper'
require './boxes/box'

describe Box do

  let(:biscuit) { "biscuit" }

  describe "#open" do
    it "makes the box open when it was closed" do
      subject.close
      subject.open
      subject.should be_open
    end
    it "leaves the box open when it was open" do
      subject.open
      subject.open
      subject.should be_open
    end
  end
  describe "#close" do
    it "makes the box closed when it was open" do
      subject.open
      subject.close
      subject.should be_closed
    end
    it "leaves the box closed when it was closed" do
      subject.close
      subject.close
      subject.should be_closed
    end
  end
  describe "#open?" do
    it "is true when the box is open" do
      subject.open
      subject.open?.should be_true
    end
    it "is false when the box is closed" do
      subject.close
      subject.open?.should be_false
    end
  end

  describe "#closed?" do
    it "is true when the box is closed" do
      subject.close
      subject.closed?.should be_true
    end
    it "is false when the box is open" do
      subject.open
      subject.closed?.should be_false
    end
  end

  describe "#store" do
    describe "when the box is empty" do
      it "returns true" do
        subject.store(biscuit).should be_true
      end
      it "stores the argument in contents" do
        subject.store(biscuit)
        subject.contents.should eq biscuit
      end
    end

    describe "when the box already contains something" do
      subject do
        box = Box.new
        box.store(biscuit)
        box
      end
      it "returns false" do
        subject.store("sock").should be_false
      end
      it "does not store the item" do
        subject.store("sock")
        subject.contents.should_not eq "sock"
      end
    end
  end

  describe "#empty?" do
    it "is true when the box is new" do
      subject.should be_empty
    end
    it "is false when something has been stored" do
      subject.store(biscuit)
      subject.should_not be_empty
    end
    it "is true again when something has been removed" do
      subject.store(biscuit)
      subject.retrieve
      subject.should be_empty
    end
  end

  describe "#retrieve" do
    it "returns nil when the box is empty" do
      subject.retrieve.should be_nil
    end
    describe "when the box is full" do
      subject do
        box = Box.new
        box.store(biscuit)
        box
      end
      it "returns the stored item" do
        stored_item = box.retrieve
        stored_item.should eq biscuit
      end
      it "makes the box empty" do
        box.retrieve
        box.should be_empty
      end
    end
  end

  describe "#shake" do
    it "returns nil when the box is empty" do
      subject.shake.should be_nil
    end
    it "returns '*rattle*' when the box is full" do
      subject.store(biscuit)
      subject.shake.should eq "*rattle*"
    end
  end
end
