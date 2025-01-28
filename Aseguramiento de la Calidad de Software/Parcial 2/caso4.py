class ShoppingCart:
    def __init__(self):
        self.items = []

    def add_item(self, item):
        self.items.append(item)

    def calculate_total_price(self):
        total = 0
        for item in self.items:
            total += item.calculate_price()
        return total

class Item:
    def __init__(self, name, price, quantity):
        self.name = name
        self.price = price
        self.quantity = quantity

    def calculate_price(self):
        return self.price * self.quantity

# Usage
cart = ShoppingCart()
cart.add_item(Item("Product 1", 10.99, 2))
cart.add_item(Item("Product 2", 5.99, 3))

# No Feature Envy - Item class responsible for calculating its own price
total_price = cart.calculate_total_price()
print(f"Total Price: ${total_price}")