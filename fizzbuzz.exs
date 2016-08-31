to_fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, x -> x
end

convert = fn
  x -> to_fizzbuzz.(rem(x, 3), rem(x, 5), x)
end

IO.puts "#{convert.(10)}, #{convert.(11)}, #{convert.(12)}, #{convert.(13)}, #{convert.(14)}, #{convert.(15)}"
