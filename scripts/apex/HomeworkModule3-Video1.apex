//Student class with first name and last name
class Student {
    String firstName;
    String lastName;

    public Student(String firstName, String lastName){
        this.firstName = firstName;
        this.lastName = lastName;
    }
}

//create a male student
Student mstudent = new Student('John', 'Doe');
System.debug('The mstudent is: ' + mstudent);
//create a female student
Student fstudent = new Student('Jane', 'Doe');
System.debug('The fstudent is: ' + fstudent);

//add the students to a list
List<Student> studentList = new List<Student>();
studentList.add(mstudent);
studentList.add(fstudent);
System.debug('The student list is: ' + studentList);