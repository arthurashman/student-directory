@students = []
def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  name = gets.chomp
  if name == ""
    name = "unknown"
  end
  puts "Please enter that student's cohort"
  cohort = gets.chomp
  if cohort == ""
    cohort = "unknown"
  end

  while !name.empty? do
    @students << {name: name.to_sym, cohort: cohort.to_sym, DoB: :dob, gender: :gender}

    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
  name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input new students"
  puts "2. List the enrolled students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "Please enter a valid option"
  end
end

def print_header
  puts "The students of Villains Academy".center(150)
  puts "-------------".center(150)
end

def print_student_list
  if @students.length > 0
    i = 0
    while @students.length > i
      puts "#{i + 1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(150)
      i += 1
    end
  end
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student".center(150)
  else
    puts "Overall, we have #{@students.count} great students".center(150)
  end
end

interactive_menu
