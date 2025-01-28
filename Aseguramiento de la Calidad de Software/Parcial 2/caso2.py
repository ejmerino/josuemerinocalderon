class Customer:
    def __init__(self, name, address):
        self.name = name
        self.address = address

    def get_full_address(self):
        return f"{self.address.street}, {self.address.city}, {self.address.country}"

class Address:
    def __init__(self, street, city, country):
        self.street = street
        self.city = city
        self.country = country

# Usage
address = Address("123 Main Street", "Cityville", "Countryland")
customer = Customer("John Doe", address)

# Feature Envy - Customer class accessing data from Address class excessively
full_address = customer.get_full_address()
print(full_address)