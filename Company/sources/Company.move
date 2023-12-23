  
module 0x42::Company {
  use std::vector;
  use std::string;
  const CONTRACT:address = @0x42;
  // you can look here to see how to print a string a lol 
  struct Employees has store, key, drop{
    people: vector<Employee>
  }
  
  struct Employee has store, key, drop, copy{
    name: vector <u8>,
    age: u8,
    income: u64,
  }
  
  public fun create_employee(_employee: Employee, _employees: &mut Employees): Employee {
    std::debug::print(&string::utf8(b"now calling the create_employee function: "));
    let newEmployee = Employee {
      name: _employee.name,
      age: _employee.age,
      income: _employee.income,
    };

    add_employee(_employees, newEmployee);
    return newEmployee
  }
  fun add_employee(_employees: &mut Employees, _employee: Employee){
    vector::push_back(&mut _employees.people, _employee)
  }
  public fun increase_income(employee: &mut Employee, bonus: u64): &mut Employee{
    employee.income = employee.income + bonus;
    return employee
  }
 public fun decrease_income(employee: &mut Employee, penalty: u64): &mut Employee{
    employee.income = employee.income - penalty;
    return employee
  }
  public fun multiply_income(employee: &mut Employee, factor: u64): &mut Employee{
    employee.income = employee.income * factor;
    return employee
  }
  public fun divide_income(employee: &mut Employee, divisor: u64): &mut Employee{
    employee.income = employee.income / divisor;
    return employee
  }
  public fun is_employee_age_even(employee: &Employee): bool {
    let isEven: bool;
  
    if (employee.age % 2 == 0){
      isEven = true;
    }
    else {
      isEven = false;
    };
    return isEven
  }
  #[test] 
  fun test_create_employee(){
    
    let ahmedou = Employee {
      name: b"Ahemdou",
      age: 25,
      income: 100
    };
    let employees = Employees {
      people: (vector[ahmedou])
    };
    let createdEmployee = create_employee(ahmedou, &mut employees);
    assert!(createdEmployee.name == ahmedou.name, 0);
  }
#[test]
  fun test_increase_income(){
    let ahmedou = Employee {
      name: b"Ahmedou",
      age: 35, 
      income: 100
    };
    let employees = Employees{
      people: (vector[ahmedou])
    };
    let createdEmployee = create_employee(ahmedou, &mut employees);
    let increasedEmployeeIncome = increase_income(&mut createdEmployee, 100);
    assert!(increasedEmployeeIncome.income == 200, 0);
  }
#[test] 
  fun test_decrease_income(){
    let perkio = Employee {
      name: b"Perkioo",
      age: 55,
      income: 300
    };
    let employees = Employees{
      people: (vector[perkio])
    };
    let createdEmployee = create_employee(perkio, &mut employees);
    let decreasedEmployeeIncome = decrease_income(&mut createdEmployee, 100);
    assert!(decreasedEmployeeIncome.income == 200, 0);
  }
#[test]
  fun test_multiply_income(){
    let smurky = Employee {
      name: b"SMurkk",
      age: 23,
      income: 21
    };
    let employees = Employees{
      people: (vector[smurky])
    };
    let createdEmployee = create_employee(smurky, &mut employees);
    let multplied_income = multiply_income(&mut createdEmployee, 3);
    assert!(multplied_income.income == 63, 0);
  }
#[test]
  fun test_is_employee_age_even(){
    let myageisnoteven = Employee {
      name: b"mm",
      age: 9,
      income: 21
    };
    let employees = Employees{
      people: (vector[myageisnoteven])
    };
    let createdEmployee = create_employee(myageisnoteven, &mut employees);
    let ageiseven = is_employee_age_even(&mut createdEmployee);
    assert!(ageiseven == false, 0);
  }
}
