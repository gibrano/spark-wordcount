
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
import org.apache.log4j.{Level, Logger}

object MyApp {
  def main(args: Array[String]) {
    val rootLogger = Logger.getRootLogger()
    rootLogger.setLevel(Level.ERROR)
    val file = args(0)
    val conf = new SparkConf(true).setAppName("My Application")
    val sc = new SparkContext(conf)
    val tf = sc.textFile(file,2)
    val splits = tf.flatMap(line => line.split(" ")).map(word =>(word,1))
    val counts = splits.reduceByKey((x,y)=>x+y)
    System.out.println(counts.collect().mkString(", "))
    sc.stop()
  }
}


