CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
  select case
  when n<=0 then null
  else
  (SELECT DISTINCT e.salary
  FROM Employee AS e
  ORDER BY e.salary DESC
  OFFSET greatest(N - 1,0) LIMIT 1
  )
  end   
  );
END;
$$ LANGUAGE plpgsql;