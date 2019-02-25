@students = []

def print_menu
  puts "1. Input new students"
  puts "2. List the enrolled students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "Please enter a valid option"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
  name = STDIN.gets.chomp
  end
end

def show_students
  if @students.length > 0
    print_header
    print_student_list
    print_footer
  else
    puts "Welcome to Villains Academy".center(150)
    puts "Currently enrolling students".center(150)
    puts "-------------".center(150)
  end
end

def print_header
  puts "The students of Villains Academy".center(150)
  puts "-------------".center(150)
end

def print_student_list
  i = 1
  @students.each do |students|
    puts "#{i}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(150)
    i += 1
  end
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student".center(150)
  else
    puts "Overall, we have #{@students.count} great students".center(150)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
