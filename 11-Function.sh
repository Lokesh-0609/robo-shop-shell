sample() {
  echo x value is - ${x}
}
sample1() {
  echo x value is -${x}
}
x=100
sample
x=500
sample1
