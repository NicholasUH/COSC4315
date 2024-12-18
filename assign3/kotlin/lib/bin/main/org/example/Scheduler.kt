package org.example

class MeetingDetails {
  val with = this
  val that = this
  val on = this
  val and = this
  val participants = this
  
  var meetingName = ""
  var meetingStartTime = -1
  var meetingEndTime = -1
  var meetingDay = -1
  var meetingMonth = ""
  var meetingYear = -1
  var meetingParticipants = ""

  infix fun name(meetingName: String) {
    this.meetingName = meetingName
  }

  infix fun starts(time: Int) {
    meetingStartTime = time
  }

  infix fun ends(time: Int) {
    meetingEndTime = time
  }

  infix fun date(day: Int): MeetingDetails {
    meetingDay = day
    return this
  }

  infix fun October(year: Int) {
    meetingMonth = "October"
    meetingYear = year
  }

  infix fun are(participants: String){
    meetingParticipants = participants
  }

  private fun formatTime(time: Int) = if (time >= 0) "%02d:%02d".format(time / 100, time % 100) else ""

  private fun pluralize(unit: String, quantity: Int) = "$quantity $unit${if (quantity != 1) "s" else ""}"

  private fun calculateDuration(): String {
    if (meetingStartTime < 0 || meetingEndTime < 0) return ""
    
    val minutes = ((meetingEndTime / 100) * 60 + meetingEndTime % 100) - ((meetingStartTime / 100) * 60 + meetingStartTime % 100)
    return "Duration: ${pluralize("hour", minutes / 60)} and ${pluralize("minute", minutes % 60)}"
  }

  fun buildMeetingString(): String = buildString {
    append("Meeting: $meetingName")
    formatTime(meetingStartTime).takeIf { it.isNotEmpty() }?.let { append(", Start Time: $it") }
    formatTime(meetingEndTime).takeIf { it.isNotEmpty() }?.let { append(", End Time: $it") }
    if (meetingStartTime >= 0 && meetingEndTime >= 0) append(", ${calculateDuration()}")
    if (meetingDay != -1 && meetingMonth.isNotEmpty() && meetingYear != -1) append(", Date: $meetingMonth $meetingDay $meetingYear")
    if (meetingParticipants.isNotEmpty()) append(", Participants: $meetingParticipants")
  }
    
}

object schedule {
  infix fun meeting(block: MeetingDetails.() -> Unit) = MeetingDetails().apply(block).buildMeetingString()
}
