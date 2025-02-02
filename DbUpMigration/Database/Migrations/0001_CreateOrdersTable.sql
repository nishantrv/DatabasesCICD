IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Orders')
BEGIN
    CREATE TABLE Orders (
        OrderID INT PRIMARY KEY,
        CustomerID INT NOT NULL
    );
END;
