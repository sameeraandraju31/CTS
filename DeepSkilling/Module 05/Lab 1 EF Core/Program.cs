using RetailInventory.Data;

using var db = new AppDbContext();

db.Database.EnsureCreated();

Console.WriteLine("Database Created Successfully!");