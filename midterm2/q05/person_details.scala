object SimpleTuple {
  def getPersonDetails: (String, Int, Double) = ("Alice", 30, 5.6)

  def main(args: Array[String]): Unit = {
    val (name, age, height) = getPersonDetails
    println(s"Name: $name")
    println(s"Age: $age")
    println(s"Height: $height")
  }
}
