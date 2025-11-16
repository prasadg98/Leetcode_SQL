# Write your MySQL query statement below
Select Employee.name, Bonus.bonus
From Employee
Left Join Bonus
On Employee.empID = Bonus.empID
Where bonus<1000 Or Bonus Is Null