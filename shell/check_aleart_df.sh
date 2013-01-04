#!/bin/sh
#参考：http://d.hatena.ne.jp/toshyon/20060324/p1
R_USEAGE=`df -h | egrep '(9[5-9]%|100%)'|wc -l`
WORK_DATE="`date +%Y%m%d`"
ADDRESS="hogehoge@hogehoge.com"
MAIL_TITLE="`hostname`で容量が95%を超えているディレクトリが有ります。至急確認して下さい"
MESSAGE_FILE="/your_directory/CHECK_DF_ALEART_${WORK_DATE}"

echo $WORK_DATE
df -h | egrep '(9[5-9]%|100%)'>$MESSAGE_FILE

if [ $DIR_USEAGE -ne 0 ]
then
  exit 1
fi
