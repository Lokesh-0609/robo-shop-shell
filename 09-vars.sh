### For loop
for vegitables in bitterourd bottlegourd ladfinger cucumber; do
  echo Vegitables name is - ${vedgitables}
  sleep 5
done

### while loop
x=10
while [ $x -gt 0 ]; do
  echo x is gt than ${x}
  x=$(($x-1)) ## x=x-1
done