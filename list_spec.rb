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

  describe "#delete_task" do
    it "given a list with one task, when delete_task is called, list is empty" do
      task = mock(:task)
      mylist = List.new('random list', [task])
      mylist.delete_task(0)
      mylist.tasks.should == []
      end
  end

  describe "#completed_tasks" do
    it "returns a list of completed tasks" do
      task1 = mock(:task)
      task1.stub(:complete?).and_return(true)
      task2 = mock(:task)
      task2.stub(:complete?).and_return(false)
      task3 = mock(:task)
      task3.stub(:complete?).and_return(true)

      mylist = List.new('random list', [task1,task2,task3])
      mylist.completed_tasks.should eq [task1,task3]
    end
  end

  describe "#incomplete_tasks" do
    it "returns a list of incomplete tasks" do
      task = mock(:task)
      task.stub(:complete?).and_return(false)
      mylist = List.new('random list', [task])
      mylist.incomplete_tasks.should eq [task]
    end
  end
end
