import unittest

from lib import func

def func2():
    b = 3
    print(b)
    func([b])


if __name__ == "__main__":
    print('hello')
    func([2])
    func2()


class Test(unittest.TestCase):
    def test_func(
        self,
    ):
        func()
        func2()
