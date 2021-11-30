import  random

def getRandomSet(bits):
    num_set = [chr(i) for i in range(48,58)]
    char_set = [chr(i) for i in range(97,123)]
    total_set = num_set + char_set

    value_set = "".join(random.sample(total_set, bits))

    return value_set

if __name__ == '__main__':
    alice_file = "../emails_alice.txt"
    bob_file = "../emails_bob.txt"
    filea = open(alice_file, w+)
    fileb = open(bob_file, w+)
    N  = 8000000
    count = 0
    while count < N:
        random_str = getRandomSet(20)
        random_str_bob = random_str + "bob"
        filea.write(random_str)
        fileb.write(random_str_bob)
        count = count + 1
    print("random email ok.")





