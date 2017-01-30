class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end
