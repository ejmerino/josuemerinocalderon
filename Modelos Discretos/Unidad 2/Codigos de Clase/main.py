from itertools import permutations, combinations

def unpack_word(word : str) -> list[str]:
    """_summary_ Returns a list with each one letter of word

    Args:
        word (str): _description_ Word to unpack

    Returns:
        list[str]: _description_ List that contains each letter of word
    """

    # List where save each letter
    letters = list()

    # Assing each letter to letters list
    for letter in word:
        letters.append(letter)

    return letters

def main() -> None:
    # Input word by keyboard that applies permutation
    word = input("Ingrese una palabra: ")
    # Input value of combination group for combinations of word
    combination_group = int(input("Ingrese el subconjunto de combinaciones: "))
    
    permutation_result = list(permutations(unpack_word(word)))
    combination_result = list(combinations(unpack_word(word), combination_group))

    print(f"El numero de permutaciones es {len(permutation_result)}")
    print(f"El numero de combinaciones es {len(combination_result)}")

    print("Permutaciones")
    for i in permutation_result:
        print(i)

    print("Combinaciones")
    for i in combination_result:
        print(i)

if __name__ == "__main__":
    main()