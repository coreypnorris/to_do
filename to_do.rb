require './lib/task'
require './lib/list'

@lists = []

def main_menu
  puts "Press 'c' to create a new list"
  puts "Press 's' to show your lists"
  puts "Press 'd' to delete a list"
  puts "Press 'a' to add a new task"
  puts "Press 'l' to list your tasks"
  puts "Press 'r' to remove a task."
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  if main_choice == 'c'
    add_new_list
  elsif main_choice == 's'
    show_lists
  elsif main_choice == 'd'
    remove_list
  elsif main_choice == 'a'
    add_new_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'r'
    remove_task
  elsif main_choice == 'x'
    "See you next time"
  else
    puts "Please enter valid option"
    main_menu
  end
end

def add_new_list
  puts "Add new list description"
  list_description = gets.chomp
  @lists << List.new(list_description)
  puts "List added \n"
  main_menu
end

def show_lists
  counter = 1
  puts "\n"
  @lists.each do |i|
    puts "#{counter})" + i.description
    counter += 1
  end
  main_menu
end

def remove_list
  counter = 1
  @lists.each do |i|
    puts "#{counter}) " + i.description
    counter += 1
  end

  puts "Which list would you like to remove? Use numbers to select."
  to_remove = (gets.chomp.to_i - 1)
  puts "#{to_remove} is removed from the list"
  @lists.delete_at(to_remove)
  puts "\n"

  counter = 1
  @lists.each do |i|
    puts "#{counter})" + i.description
    counter += 1
  end
  main_menu
end

def add_new_task
  puts "Enter description for your task."
  task_description = gets.chomp
  task_to_add = Task.new(task_description)

  puts "Which list do you want to add this task to? Use numbers to select."
  counter = 1
  @lists.each do |i|
    puts "#{counter}) " + i.description
    counter += 1
  end
  to_add = (gets.chomp.to_i - 1)

  @lists[to_add].tasks << task_to_add
  puts "Your task is added."
  main_menu
end

 # puts "\n"

def list_tasks
  puts "Which list of tasks would you like to see? Use numbers to select."
  counter = 1
  @lists.each do |i|
    puts "#{counter})" + i.description
    counter += 1
  end
  puts "\n\n"

  to_show = (gets.chomp.to_i - 1)
  counter = 1
  @lists[to_show].tasks.each do |i|
    puts "#{counter})" + i.description
    counter += 1
  end
  puts "Here are your tasks."
  main_menu
end



def remove_task
  puts "In which list would you like to remove a task? Use numbers to select."
  counter = 1
  @lists.each do |i|
    puts "#{counter}) " + i.description
    counter += 1
  end
  puts "\n\n"
  puts "Which task would you like to remove? Use numbers to select."
  to_show = (gets.chomp.to_i - 1)
  counter = 1
  @lists[to_show].tasks.each do |i|
    puts "#{counter})" + i.description
    counter += 1
  end
  to_remove = (gets.chomp.to_i - 1)
  @lists[to_show].tasks.delete_at(to_remove)
  puts "Task removed."

  main_menu
end

main_menu
















