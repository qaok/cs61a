def make_adder(n):
    """Return a function that takes a K and return K + N.
    >>> add_three = make_adder(3)
    >>> add_three(4)
    7
    """
    def adder(k):
        def re_adder(x):
            return k + n + x
        return re_adder
    return adder