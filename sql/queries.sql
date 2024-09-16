-- Tüm aktif çalışanları listele
SELECT * FROM Employees WHERE status = 'active';

-- IT departmanındaki tüm çalışanları listele
SELECT * FROM Employees WHERE department = 'IT';

-- Bir departmanın yöneticisini bul
SELECT e.first_name, e.last_name, d.department_name FROM Employees e
JOIN Departments d ON e.id = d.manager_id WHERE d.department_name = 'Finance';

-- Çalışan maaş ortalamasını hesapla
SELECT AVG(salary) AS average_salary FROM Employees;

-- Aktif çalışanların maaş toplamını bul
SELECT SUM(salary) AS total_salary FROM Employees WHERE status = 'active';
