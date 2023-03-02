CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
    then
        echo "file submitted"
else
    echo "incorrect files submitted"
    exit 1
fi

cp ../TestListExamples.java ./
javac ListExamples.java

if [[ $? -eq 0 ]]
    then 
        echo "compile success"
else 
    echo "compile failure"
    exit 1
fi
cd ../
javac -cp ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" *.java
java -cp ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > output.txt
grep "Tests run:" output.txt > result.txt
cat result.txt