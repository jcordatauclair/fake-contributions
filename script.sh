# YEAR (any)
let "Y_min = 2019" # min
let "Y_max = 2019" # max

# MONTH (between 1 and 12)
let "M_min = 01" # min
let "M_max = 03" # max

# DAY (between 1 and 31)
let "D_min = 01" # min
let "D_max = 31" # max

# % OF CHANCE TO CONTRIBUTE ON A GIVEN DAY
let "P_contribute = 6"

for Y in {$Y_min..$Y_max}
do
  mkdir $Y
  cd $Y
  for M in {$M_min..$M_max}
  do
    mkdir $M
    cd $M
    for D in {$D_min..$D_max}
    do
      let "P_random = (RANDOM % 10 + 1)" # random number between 1 and 10
      if test $P_random -lt $P_contribute
      then
        let "N_contributions = (RANDOM % 6 + 1)" # number of contributions
        mkdir $D
        cd $D
        for i in {1..$N_contributions}
        do
          echo "0$i on $M/$D/$Y" > commit.md
          export GIT_COMMITTER_DATE="$Y-$M-$D 12:0$i:00"
          export GIT_AUTHOR_DATE="$Y-$M-$D 12:0$i:00"
          git add commit.md -f
          git commit --date="$Y-$M-$D 12:0$i:00" -m "0$i on $M $D $Y"
        done
        cd ../
      fi
    done
    cd ../
  done
  cd ../
done
git push origin master
git rm -rf 20**
git commit -am "cleanup"
git push origin master
