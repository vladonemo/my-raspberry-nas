for x in *.MPG; do
  Y=$(date -r "$x" +%Y)
  m=$(date -r "$x" +%m)
  d=$(date -r "$x" +%d)
  #echo need to move to "$Y"\\"$m"\\"$d"
  mkdir -p "$Y/$m/$d"
  mv -- "$x" "$Y/$m/$d/"
done
