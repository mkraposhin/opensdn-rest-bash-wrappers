## @file
## @brief A set of functions to check OpenSDN virtual environment
## @author Matvey Kraposhin

if [[ -v CHECK_FUNCTIONS ]]
then
    echo "The file check_functions.sh has been already sourced"
    echo "Can not proceed"
    exit 0
fi

## @fn check_project_existence()
## @brief Checks if a project exists
function check_project_existence() {
    local proj_name="$1"
    local proj_fq_name=`name_to_fq_name "domain:$proj_name"`
    local proj_uuid=`fq_name_to_uuid "$proj_fq_name" project`
    echo "$proj_uuid"
}

## @fn check_no_tags()
## @brief Checks if there are no tags
function check_no_tags() {
    echo ""
}

## @brief A guard variable to prevent recursive execution of check_functions.sh
export CHECK_FUNCTIONS=

#
#END-OF-FILE
#
