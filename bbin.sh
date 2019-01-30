#############################################################################
#       BBIN
#   PASTEBIN API BY BCLERC
#   https://github.com/bclerc/bbin
############################################################################

BASEDIR=$(dirname "$0")
source $BASEDIR/config.yml
APIKEY="$apikey" 
USERKEY="$userkey"
RED='\033[0;31m'
GREEN='\033[1;32m'
ORANGE='\033[0;33m'
DATE=10M
PRIVATE='0'
FORMAT=TEXT
NAME="BBIN FILES"
VERSION=`cat $BASEDIR/version.txt`
UPDATE=$(curl -s https://raw.githubusercontent.com/bclerc/bbin/master/version.txt\?$(date +%s))

while getopts "n:d:f:pvui" flag
do
    case $flag in

    p)
        PRIVATE='2'
        ;;
    f)
        FORMAT=$OPTARG
        ;;
    n)
        NAME=$OPTARG
        ;;
    d)
        DATE=$OPTARG
        ;;
    v)
        echo "${GREEN}Version: $VERSION"
        exit;
        ;;
    i)
        echo "alias bbin=${PWD}/bbin.sh" >> ~/.zshrc
        source ~/.zshrc
        exit
        ;;
    u)
        if [ "$UPDATE" = "$VERSION" ]
            then
                echo "${ORANGE}Aucune mise à jour disponible"
                exit
            else
                echo "${ORANGE}Mise à jour ... (${RED}$VERSION${ORANGE} -> ${GREEN}$UPDATE${ORANGE})";
                git -C $BASEDIR pull origin master --force -q && echo "${GREEN}Mise à jour terminée !" || (echo "${RED}La mise à jour n'a pas eu lieu" && exit)
                exit
        fi
        exit;
        ;;
    esac
done

if [ "$UPDATE" != "$VERSION" ]
    then
        echo "${RED}Une nouvelle mise à jour est disponible ($ORANGE$UPDATE$RED) version.";
        echo "${ORANGE}Pour mettre à jour $GREEN bbin -u";
fi

INPUT=$( cat - )
request="api_option=paste&\
api_dev_key=${APIKEY}&\
api_paste_private=${PRIVATE}&\
api_user_key=${USERKEY}&\
api_paste_format=${FORMAT}&\
api_paste_expire_date=${DATE}&\
api_paste_name=${NAME}&\
api_paste_code=$INPUT"

result=$(curl -s -d "${request}" http://pastebin.com/api/api_post.php)
    
 echo "
${ORANGE}=============================== ${GREEN}BBIN V.1.0${ORANGE} ===============================
 
$result
${GREEN}Copié dans le press-papier

${ORANGE}========================================================================== 
" && echo $result | pbcopy
