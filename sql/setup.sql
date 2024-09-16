-- Çalışanlar tablosunu oluşturma
CREATE TABLE Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    department VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE,
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Departmanlar tablosu
CREATE TABLE Departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (manager_id) REFERENCES Employees(id)
);

-- Çalışanlara örnek veriler ekleme
INSERT INTO Employees (first_name, last_name, email, department, position, salary, hire_date, status) VALUES
('Ulaş', 'Günhan', 'ulas@company.com', 'IT', 'DevOps Engineer', 5500.00, '2021-05-10', 'active'),
('Berkay', 'Nalbant', 'berkay@company.com', 'HR', 'HR Manager', 8000.00, '2020-07-22', 'active'),
('Vasfi', 'Doğan', 'vasfi@company.com', 'Finance', 'Financial Analyst', 6000.00, '2019-09-15', 'active'),
('Ayşe', 'Güneş', 'ayse@company.com', 'IT', 'Data Scientist', 7000.00, '2022-01-10', 'active'),
('Elif', 'Yıldız', 'elif@company.com', 'Marketing', 'Marketing Specialist', 6800.00, '2021-08-30', 'inactive');

-- Departmanlara örnek veriler ekleme
INSERT INTO Departments (department_name, manager_id) VALUES
('IT', 1),
('HR', 2),
('Finance', 3),
('Marketing', 5);
