-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/submissions/1936352125/

SELECT name FROM Employee WHERE id IN (select managerId from Employee  GROUP BY managerId HAVING COUNT(managerId) > 4);
