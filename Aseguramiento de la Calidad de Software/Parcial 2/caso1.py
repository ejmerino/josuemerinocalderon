class Customer:
    def __init__(self, name, address):
        self.name = name
        self.address = address

class Address:
    def __init__(self, street, city, country):
        self.street = street
        self.city = city
        self.country = country

    def get_full_address(self):
        return f"{self.street}, {self.city}, {self.country}"

# Usage
address = Address("123 Main Street", "Cityville", "Countryland")
customer = Customer("John Doe", address)

# No Feature Envy - Address class responsible for providing the full address
full_address = customer.address.get_full_address()
print(full_address)