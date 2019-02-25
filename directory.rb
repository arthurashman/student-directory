def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  students = []
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
    students << {name: name.to_sym, cohort: cohort.to_sym, DoB: :dob, gender: :gender}

    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
  name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(150)
  puts "-------------".center(150)
end

def print(students)
  if students.length > 0
    i = 0
    while students.length > i
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)".center(150)
      i += 1
    end
  end
end

def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.count} great student".center(150)
  else
    puts "Overall, we have #{students.count} great students".center(150)
  end
end

def interactive_menu
  students = []
  loop do
    puts "1. Input new students"
    puts "2. List the enrolled students"
    puts "3. Exit"

    selection = gets.chomp

    case selection
      when "1"
        students = input_students
      when "2"
        if students.length > 0
          print_header
          print(students)
          print_footer(students)
        else
          puts "Welcome to Villains Academy".center(150)
          puts "Currently enrolling students".center(150)
          puts "-------------".center(150)
        end
      when "9"
      else
        puts "Please enter a valid option"
      end
    end
  end

interactive_menu
