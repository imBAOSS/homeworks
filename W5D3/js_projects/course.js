function Course(name, dept, credits, days, time) {
  this.name = name;
  this.dept = dept;
  this.credits = credits;
  this.enrolledStudents = [];
  this.days = days;
  this.time = time;
}

Course.prototype.addStudent = function (student) {
  this.enrolledStudents.push(student);
};

Course.prototype.students = function () {
  return this.enrolledStudents;
};
Course.prototype.conflictsWith = function (course) {
  let result;
  this.days.forEach((day) => {
    if (course.days.includes(day) && this.time === course.time) {
      result = true;
    }
  });
   result = false;
};

module.exports = Course;
