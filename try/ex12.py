def strStr(haystack, needle):
    """
    :type haystack: str
    :type needle: str
    :rtype: int
    """
    a, b = 0, 0
    n, k = len(haystack), len(needle)
    while a <= n:
        if needle in haystack:
            while b <= k:
                if haystack[a] == needle[b]:
                    a, b = a + 1, b + 1
                else:
                    a += 1
                    b = 0
            return a - b
        else:
            return -1