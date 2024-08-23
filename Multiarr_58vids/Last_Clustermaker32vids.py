import itertools
import random
import time
import tracemalloc

# A non memory intensive version of the wokringexample_original32 vids but runs slower
def get_new_combinations(my_list, batch_size):
    two_item_combinations = set(itertools.combinations(my_list, 2))
    new_combinations = []
    while two_item_combinations:
        best_combination = None
        best_sub_combinations = None
        best_count = 0
        for combination in itertools.combinations(my_list, batch_size):
            sub_combinations = set(itertools.combinations(combination, 2))
            count = len(sub_combinations & two_item_combinations)
            if count > best_count:
                best_combination = combination
                best_sub_combinations = sub_combinations
                best_count = count
        if best_combination is not None:
            new_combinations.append(best_combination)
            two_item_combinations -= best_sub_combinations
    return new_combinations

my_list = list(range(0,24))
batch_size = 8

start_time = time.time()
tracemalloc.start() 
batches = get_new_combinations(my_list, batch_size)
current, peak = tracemalloc.get_traced_memory()  
tracemalloc.stop()  

end_time = time.time()

print("Time taken: ", end_time - start_time, "seconds")
print(f"Current memory usage is {current / 10**6}MB; Peak was {peak / 10**6}MB")
"""
random.shuffle(batches)
for combination in batches:
    print("New combination:", combination)
    result = [new_list[i] for i in combination]
    print(result)
"""