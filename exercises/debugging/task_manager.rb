# Why is an exception raised?

# The exception message states that select is called for nil. This occurs
#  after the display_high_priority_tasks method is invoked. Examining the
#  display_high_priority_tasks instance method, it can be seen that the select
#  method is called on tasks. There is an instance variable tasks and a getter
#  method has been established for this instance variable via attr_accessor.
#  The issue seems likely due to the fact that this select method invocation with
#  a block is going to return a value that will be assigned to a new local variable
#  also called tasks. So, ruby might be looking for a local variable tasks to call
#  select on, but it hasn't been assigned to a value yet, so an exception is raised
#  for calling a method on nil. To resolve this, the local variable tasks within the
#  display_high_priority_tasks instance method can be renamed to something different,
#  so that the tasks getter method will be called within the evaluation of tasks.select.

class TaskManager
  attr_reader :owner
  attr_accessor :tasks

  def initialize(owner)
    @owner = owner
    @tasks = []
  end

  def add_task(name, priority=:normal)
    task = Task.new(name, priority)
    tasks.push(task)
  end

  def complete_task(task_name)
    completed_task = nil

    tasks.each do |task|
      completed_task = task if task.name == task_name
    end

    if completed_task
      tasks.delete(completed_task)
      puts "Task '#{completed_task.name}' complete! Removed from list."
    else
      puts "Task not found."
    end
  end

  def display_all_tasks
    display(tasks)
  end

  def display_high_priority_tasks
    # tasks = tasks.select do |task|
    important_tasks = tasks.select do |task|
      task.priority == :high
    end

    #display(tasks)
    display(important_tasks)
  end

  private

  def display(tasks)
    puts "--------"
    tasks.each do |task|
      puts task
    end
    puts "--------"
  end
end

class Task
  attr_accessor :name, :priority

  def initialize(name, priority=:normal)
    @name = name
    @priority = priority
  end

  def to_s
    "[" + sprintf("%-6s", priority) + "] #{name}"
  end
end

valentinas_tasks = TaskManager.new('Valentina')

valentinas_tasks.add_task('pay bills', :high)
valentinas_tasks.add_task('read OOP book')
valentinas_tasks.add_task('practice Ruby')
valentinas_tasks.add_task('run 5k', :low)

valentinas_tasks.complete_task('read OOP book')

valentinas_tasks.display_all_tasks
valentinas_tasks.display_high_priority_tasks