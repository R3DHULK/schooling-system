# Set up the initial variables
classes <- list("Math", "English", "Science", "History")
students <- list()
teachers <- list()
quit <- FALSE

# Define the functions for adding students and teachers
add_student <- function() {
  name <- readline(prompt="Enter student name: ")
  class <- readline(prompt="Enter student class (Math, English, Science, or History): ")
  if (class %in% classes) {
    students[[name]] <<- class
    cat(name, "added to class", class, "\n")
  } else {
    cat("Invalid class entered.\n")
  }
}

add_teacher <- function() {
  name <- readline(prompt="Enter teacher name: ")
  class <- readline(prompt="Enter teacher class (Math, English, Science, or History): ")
  if (class %in% classes) {
    teachers[[name]] <<- class
    cat(name, "assigned to teach class", class, "\n")
  } else {
    cat("Invalid class entered.\n")
  }
}

# Main game loop
while (!quit) {
  # Clear the screen and show the options
  system("clear")
  cat("Welcome to School Simulator!\n\n")
  cat("1. Add student\n")
  cat("2. Add teacher\n")
  cat("3. List students by class\n")
  cat("4. List teachers by class\n")
  cat("5. Quit\n\n")

  # Get the user's choice and act accordingly
  choice <- readline(prompt="Enter your choice: ")
  if (choice == "1") {
    add_student()
  } else if (choice == "2") {
    add_teacher()
  } else if (choice == "3") {
    class <- readline(prompt="Enter class (Math, English, Science, or History): ")
    if (class %in% classes) {
      students_in_class <- names(students)[students == class]
      if (length(students_in_class) > 0) {
        cat(paste(students_in_class, collapse=", "), "\n")
      } else {
        cat("No students in class.\n")
      }
    } else {
      cat("Invalid class entered.\n")
    }
    readline(prompt="Press Enter to continue...")
  } else if (choice == "4") {
    class <- readline(prompt="Enter class (Math, English, Science, or History): ")
    if (class %in% classes) {
      teachers_in_class <- names(teachers)[teachers == class]
      if (length(teachers_in_class) > 0) {
        cat(paste(teachers_in_class, collapse=", "), "\n")
      } else {
        cat("No teachers in class.\n")
      }
    } else {
      cat("Invalid class entered.\n")
    }
    readline(prompt="Press Enter to continue...")
  } else if (choice == "5") {
    quit <- TRUE
  } else {
    cat("Invalid choice entered.\n")
    readline(prompt="Press Enter to continue...")
  }
}
