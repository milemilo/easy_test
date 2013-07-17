require "rspec"

require_relative "list"

describe List do

  describe "#initialize" do
    it "takes a title for its first argument" do
      List.new("Grocery List", ["milk", "eggs"] ).should be_an_instance_of List
    end

    it "requires two arguments" do
      expect { List.new }.to raise_error(ArgumentError)
    end
  end

  describe "#add_task" do
    it "appends a task to the tasks array" do
      mylist = List.new('shopping list')
      mylist.add_task("peanut butter")
      mylist.tasks.should == ["peanut butter"]
    end
  end

  describe "#complete_task" do
    it "marks a task at index as complete" do
      task = mock(:task)
      mylist = List.new('shopping list', [task])

      task.should_receive(:complete!)
      mylist.complete_task(0)
    end
  end

end
