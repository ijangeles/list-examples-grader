CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if[[ -f student-submission/ListExamples.java ]]
then
    echo "file submitted"
else
    echo "incorrect files submitted"
    exit 
fi

javac -cp $CPATH *.java

if[[$? -eq 0]]
then 
    echo "compile success"
    java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
else 
    echo "compile failure"
fi

grep -c "error" output.txt