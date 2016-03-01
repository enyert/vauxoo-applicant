"""
primes module contains the PrimeClass class. Used to handle with prime numbers checking process
"""


class PrimeClass(object):
    """
    PrimeClass use the is_prime method to check if a number is prime
    """

    def is_prime(self, num_int):
        """
        Check if a number is prime

            Keyword arguments:
                num_int -- represents the number to check
        """
        from math import sqrt
        #This is the case for negative numbers
        if num_int < 0:
            num_int *= abs(num_int)

        #Special case for the two first prime numbers
        if num_int == 2:
            return True

        #The number 2 is the only even prime number so we discard all the other even numbers
        if num_int % 2 == 0 or num_int == 1:
            return False

        #Now we have to implement the cycle that calculates the divisors until the square root of num_int
        #We are excluding the even numbers so we use step 2 to iterate over the odd numbers
        for sub_item in range(3, int(sqrt(num_int)) + 1, 2):
            if num_int % sub_item == 0:
                return False

        return True
