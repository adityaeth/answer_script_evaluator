answer=answers.txt
scripts=answer_scripts/*.txt
export answer
export scripts

check_sheets() {
    echo "Checking Sheets.."
    questions=`cat $answer | grep -i "." | wc -l`
    echo "Number of questions found: $questions"
    echo 
    for i in $scripts; do
        echo $i `diff $answer $i | grep -i ">" | wc -l | expr $questions - ` >> marks.txt
    done
}