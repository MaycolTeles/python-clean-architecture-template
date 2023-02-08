"""
Module to test the "main()" function.
"""

from unittest import TestCase

from src import main


class TestMain(TestCase):
    """
    Class to test the "main()" function.
    """

    def test_should_call_main(self) -> None:
        """
        Method to assert the main method was called.
        """
        main()

        actual = True

        self.assertTrue(actual)
