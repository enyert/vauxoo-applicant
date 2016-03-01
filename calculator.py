"""
calculator module contains the CalculatorClass to handle the sum of any number list
"""


class CalculatorClass(object):
    """
    Handle the sum of a given number list with the help of the sum method
    """

    def sum(self, num_list):
        """
        Calculate the sum of a given number list

            Keyword Arguments:
                num_list -- contains a list of numbers
        """
        return sum(num_list)