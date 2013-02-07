#!/bin/bash
# This script imports three kinds of WWM media files from XML into an existing MySQL database.
source passwords
for zip in $(find . -mindepth 4 ) ; do
    
    export d=`echo $zip|tr "/" " "`
    set -- $d
    export year=$2
    export month=$3
    export day=$4
    export country=${5:7:3}
    #echo "$2-$3-$4 from $country"
    #echo $d ;
    echo "Processing $zip"
    rm showtimes.xml
    unzip -p "$zip" '*S.XML' > showtimes.xml
    unzip -p "$zip" '*T.XML' > theatres.xml


    sed -E 's/<\/show_date>//g' < showtimes.xml > showtimes2.xml
    sed -E 's/<show_date date="([0-9][0-9][0-9][0-9])([0-9][0-9])([0-9][0-9])">/<show_date>\1-\2-\3<\/show_date>/g'  < showtimes2.xml > showtimes3.xml
    export showtime_query="
      LOAD XML 
      LOCAL INFILE '"`pwd`/showtimes3.xml"'
      INTO TABLE showtime 
      ROWS IDENTIFIED BY '<showtime>'
      SET source_country='"$country"', source_file='"$zip"';
"
    export theatre_query="
      LOAD XML 
      LOCAL INFILE '"`pwd`/theatres.xml"'
      INTO TABLE theater 
      ROWS IDENTIFIED BY '<theater>'
      SET source_country='"$country"', source_file='"$zip"';
"
    echo "$showtime_query"
    mysql -usteve -p"$steve_password" wwm1 --local-infile -e "$showtime_query"
    #mysql -usteve -p"$steve_password" wwm1 --local-infile -e "$theatre_query"
    #exit
done
