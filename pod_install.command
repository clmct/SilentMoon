# найдем директорию, в которой лежит файл исполняемого скрипта
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

# перейдем в нее
cd "$DIR"

# установим поды
pod install