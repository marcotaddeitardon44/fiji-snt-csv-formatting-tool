# !/bin/bash
# Define the folders variable

export PATH=$(pwd):$PATH
folders=$(ls)
for folder in $folders
do
  cd "$folder" || exit
  # Define files as the group of csvs we are going to work with
  files=$(ls | grep Sholl_Table)
  for file in $files
  do
    # This command allows us to cut the 2 first columns of each original CSV and
    # pastes it in a provisional file named cut_ for each CSV
    cut -f 1,2 -d "," $file > cut_$file
  done
  # This command unifies all provisional cuts in one single temp
  paste -d "," cut* > temp
  # sed son sustituciones
  # tail permite coger los elementos empezando por el final al poner -n+2
  # empezamos por la segunda fila. Eliminando el header de los CSVs originales
  cat temp | sed 's/,,/,NA,NA,/g' | sed 's/,,/,NA,NA,/g' | sed 's/^,/NA,NA,/g' | sed 's/,$/,NA,NA/g' | sed 's/,/\t/g' | sed 's/\.0//g' | tail -n+2 > $folder.tsv
  rm temp
  rm cut*
  format_table.R $folder.tsv
  cd ..
  echo "$folder.tsv created"

done
