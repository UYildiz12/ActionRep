import itertools
import random
import time
import tracemalloc


#A version of the optimal algorithm that will ensure that each index will appear with every other index at least once
# and minimize the number of batches it is both time and memory intensive thus shouldn't be used with very high number 
# of videos. It can be optimized further later on but current version will work on 32 videos without issue. 

def get_combinations(my_list, batch_size):
    two_item_combinations = set(itertools.combinations(my_list, 2))
    batch_item_combinations = list(itertools.combinations(my_list, batch_size))

    return two_item_combinations, batch_item_combinations

def get_new_combinations(my_list, batch_size):
    two_item_combinations, batch_item_combinations = get_combinations(my_list, batch_size)
    new_combinations = []
    while two_item_combinations:
        batch_item_combinations.sort(key=lambda x: len(set(itertools.combinations(x, 2)) & two_item_combinations), reverse=True)
        for combination in batch_item_combinations:
            sub_combinations = set(itertools.combinations(combination, 2))
            if sub_combinations & two_item_combinations:
                new_combinations.append(combination)
                two_item_combinations -= sub_combinations
                break
    return new_combinations

#Number of videos in your dataset
my_list = list(range(0,8))
#How many should appear in the screen at once
batch_size = 8

start_time = time.time()
tracemalloc.start()  
batches = get_new_combinations(my_list, batch_size)
current, peak = tracemalloc.get_traced_memory()
tracemalloc.stop()  
end_time = time.time()

print("Time taken: ", end_time - start_time, "seconds")
print(f"Current memory usage is {current / 10**6}MB; Peak was {peak / 10**6}MB")


print("Time taken: ", end_time - start_time, "seconds")

random.shuffle(batches)

#Saves the indexes of videos as a txt file with each batch of indexes on a line
"""
with open(f'batches_{len(my_list)}videos_batchsize{batch_size}.txt', 'w') as f:
    for batch in batches:
        f.write(', '.join(map(str, batch)) + '\n')
"""