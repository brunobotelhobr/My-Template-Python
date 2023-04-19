"""Main module"""
from app import calc


def main():
    """Entry point for main"""
    print("Hello World!")
    return "Hello World!"


def calc_main():
    """Entry point for Calculator"""
    print(calc.add(1, 2))
    print(calc.subtract(1, 2))
    print(calc.multiply(1, 2))
    print(calc.divide(1, 2))


main()
calc_main()
