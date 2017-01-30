require_relative 'employee'

class Manager < Employee
  attr_reader :employees

  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      sum += employee.salary
      if employee.is_a?(Manager)
        sum += employee.bonus(1)
      end
    end
    sum * multiplier
  end

  def add_employee(employee)
    @employees ||= []
    @employees << employee
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
