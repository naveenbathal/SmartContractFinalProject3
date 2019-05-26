pragma solidity ^0.5.1;

contract employee
{
    
    event Salary(address to,uint amount);
    address owner;
    struct newemployee
    {   uint id;
        string name;
        uint age;
        uint256 blocknumber;
        string position;
        
    }
        
 newemployee[] public emplist;
 uint empcount;
 
 mapping(address=>uint) Salary1;
 
 constructor() public
 {
     owner=msg.sender;
     empcount=0;
 }
 
 
 function addnewEmployee(uint _id,string memory _name,uint _age,string memory _position,uint _salary,address _emp) public onlyowner
 {
     emplist.push(newemployee(_id,_name,_age,block.number,_position));
     Salary1[_emp]=_salary;
     empcount++;
     
     
     
 }
 modifier onlyowner()
 {
     require(msg.sender==owner);
     _;
 }
  function EmployeeSalary(address from) private view returns(uint)
    {
        return(Salary1[from]);
    }
    
    function callSalary(address from) public view returns(uint)
    {
        uint balance=EmployeeSalary(from);
        return balance;
        
    }
    
function calBonus(address _emp) public view returns(uint)
{
    require(msg.sender==owner);
    uint bonus=Salary1[_emp] * 2;
    return bonus;
    
}
function transferSalary(address payable _emp)  payable  public onlyowner
{
  _emp.transfer(msg.value);
  emit Salary(_emp,msg.value);
}

}