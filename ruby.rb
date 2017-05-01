def reverseString input
  myList = ''
  word = input.length
  while word > 0
    word -= 1
    myList += input[word]
  end
  myList
end

puts reverseString('hello')