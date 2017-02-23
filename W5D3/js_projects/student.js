function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function () {
  return `${this.firstName} ${this.lastName}`;
};

Student.prototype.enroll = function (course) {
  if (!this.courses.includes(course)) {
    this.courses.push(course);
    course.addStudent(this.name());
  }
};

Student.prototype.courseLoad = function () {
  let load = {};
  this.courses.forEach((course) => {
    load[course.dept] = 0;
  });

  this.courses.forEach((course) => {
    load[course.dept] += course.credits;
  });

  return load;
};

module.exports = Student;

const Course = require("./course");

let s1 = new Student("Bob", "Smith");
let c1 = new Course("Art 101", "Art", 2, ["M", "W", "F"], 2);
let c2 = new Course("Computer Science", "CS", 10, ["M", "W", "F"], 2);
s1.enroll(c1);
