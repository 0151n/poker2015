#test output file for hands
ruby test.rb > test.txt
echo "number of Pairs:"
grep -c -w "Pair" test.txt
echo "number of Two Pairs:"
grep -c -w "Two Pairs" test.txt
echo "number of Flushes:"
grep -c -w "Flush" test.txt
echo "number of three of a kind:"
grep -c -w "Three of a Kind" test.txt
echo "number of Four of a Kind:"
grep -c -w "Four of a Kind" test.txt
echo "number of Royal Flush:"
grep -c -w "Royal Flush" test.txt
echo "number of straights:"
grep -c -w "Straight" test.txt
echo "number of straight flushes:"
grep -c -w "Straight Flush" test.txt
echo "number of high cards:"
grep -c -w "High Card" test.txt
rm test.txt
