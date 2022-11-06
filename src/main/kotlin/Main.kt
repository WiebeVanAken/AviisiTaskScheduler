import java.time.LocalDateTime
import java.util.*
import kotlin.concurrent.scheduleAtFixedRate

fun main() {
    val timer = Timer()
    timer.scheduleAtFixedRate(0, 1000) { println(LocalDateTime.now().toString()) }

    while(true) {}
}