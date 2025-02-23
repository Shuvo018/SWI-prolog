def checkCapacity(a,b,CB) :
    if a > (CB-b):
        r = a - (CB - b)
        b += a - r
        a = r
    else:
        b += a
        a = 0
    return a, b
def isFull(b, CB):
    return 0 if b == CB else b
def isAns(target, a):
    return target == a
def isEmpty(a, CA):
    return CA if a == 0 else a
def go(a, b, target):
    steps = 0
    flag = False
    while flag != True:

        a = isEmpty(a, CA)
        flag = isAns(target, a)
        if flag == False:
            steps += 1
        a , b = checkCapacity(a,b,CB)
        flag = isAns(target, a)
        if flag == False:
            steps += 1
        b = isFull(b, CB)
        flag = isAns(target, a)
        if flag == False:
            steps += 1
    return steps

CA = 4
CB = 1
a = b = 0
target = 2
print("steps: ", go(b, a, target))
