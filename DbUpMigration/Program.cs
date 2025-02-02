using System;
using System.Reflection;
using DbUp;

class Program
{
    static int Main(string[] args)
    {
        // Use connection string from arguments or fallback to local DB
        var connectionString = args.Length > 0 ? args[0] :
            "Server=NishantRV\\MSSQLSERVER2022;Database=TestDB;Integrated Security=True;";

        // Configure and execute DbUp
        var upgrader = DeployChanges.To
            .SqlDatabase(connectionString)
            .WithScriptsFromFileSystem(@"C:\Users\nisha\DatabasesCICD\DbUpMigration\Database\Migrations") // Path to SQL scripts
            .LogToConsole()
            .Build();

        var result = upgrader.PerformUpgrade();

        // Handle success/failure
        if (!result.Successful)
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("Migration failed: " + result.Error);
            Console.ResetColor();
            return -1;
        }

        Console.ForegroundColor = ConsoleColor.Green;
        Console.WriteLine("Database migration successful!");
        Console.ResetColor();

        return 0;
    }
}
