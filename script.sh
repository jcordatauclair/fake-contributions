#==============================================================================#
#                 ¯\_(ツ)_/¯ FAKE CONTRIBUTIONS ¯\_(ツ)_/¯                      #
#==============================================================================#

# Years of contribution -------------------------------------------------------#
for Y in {2018..2018}
do
  mkdir $Y
  cd $Y

  # Months of contribution ----------------------------------------------------#
  for M in {06..06}
  do
    mkdir $M
    cd $M

    # Days of contribution ----------------------------------------------------#
    for D in {12..31}
    do
      mkdir $D
      cd $D

      let "RAND=(RANDOM % 6 + 1)" # random number of contributions per day
      for ((i=1; i<=RAND; i++))
      do
        echo "0$i on $M/$D/$Y" > commit.md
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:0$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:0$i:00"
        git add commit.md -f
        git commit --date="$Y-$M-$D 12:0$i:00" -m "0$i on $M $D $Y"
      done
      cd ../
    done
    cd ../
    #--------------------------------------------------------------------------#

  done
  cd ../
  # ---------------------------------------------------------------------------#

done
#------------------------------------------------------------------------------#

# Git commands ----------------------------------------------------------------#
git push origin master
git rm -rf 20**
git commit -am "cleanup"
git push origin master
#------------------------------------------------------------------------------#
