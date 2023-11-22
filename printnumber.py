from num2words import num2words
names={10:"ten",20:"twenty",30:"thirty",40:"forty",50:"fifty",60:"sixty",70:"seventy",80:"eighty",90:"ninety",100:"hundred"}
number =0
while number <= 99:
        
        number = number + 1
        if number in names:
           k=names.get(number)
           print (k)
        else:
                   print (number)