"""Test the main function."""
from app.main import main


def test_main():
    """Test the main function."""
    assert main() == "Hello World!"
