# change every instance of the value 3 to an instance of the value 4

arr1 = [1, [2, 3], 4]

arr1[1][1] = 4

#check work:
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

arr2[2] = 4
#check work:
p arr2

hsh1 = {first: [1, 2, [3]]}

hsh1[:first][2][0] = 4
#check work:
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

hsh2[['a']][:a][2] = 4
#check work:
p hsh2