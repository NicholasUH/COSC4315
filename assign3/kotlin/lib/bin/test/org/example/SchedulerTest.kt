package org.example

import io.kotest.core.spec.style.StringSpec
import io.kotest.matchers.shouldBe
import io.kotest.matchers.string.shouldContain

class SchedulerTest : StringSpec({
  "canary test should always pass" {
    true shouldBe true
  }

  "returns a meeting with no arguments" {
    val result = schedule meeting {}

    result shouldBe "Meeting: "
  }

  "returns a meeting with the provided name" {
    val result = schedule meeting {
        with name "early admissions"
    }

    result shouldBe "Meeting: early admissions"
  }

  "returns a meeting with the provided name and start" {
    val result = schedule meeting {
      with name "early admissions"
      that starts 1430  
    }

    result shouldBe "Meeting: early admissions, Start Time: 14:30"
  }

  "returns a meeting with the provided name, start, and end" {
    val result = schedule meeting {
      with name "early admissions"
      that starts 1430 
      and ends 1530
    }

    result shouldContain "Meeting: early admissions, Start Time: 14:30, End Time: 15:30"
  }

  "returns a meeting with the provided name, start, end, and duration" {
    val result = schedule meeting {
      with name "early admissions"
      that starts 1430 
      and ends 1530
    }

    result shouldBe "Meeting: early admissions, Start Time: 14:30, End Time: 15:30, Duration: 1 hour and 0 minutes"
  }

  "returns a meeting with the provided name, start, end, duration, and date" {
    val result = schedule meeting {
      with name "early admissions"
      that starts 1430 
      and ends 1530
      on date 15 October 2018
    }

    result shouldBe "Meeting: early admissions, Start Time: 14:30, End Time: 15:30, Duration: 1 hour and 0 minutes, Date: October 15 2018"
  }

  "returns a meeting with the provided name, start, end, duration, date, and participants" {
    val result = schedule meeting {
        with name "early admissions"
        that starts 1430 
        and ends 1530
        on date 15 October 2018
        participants are "Kim R., Mike B., Paula P., Chin Z."
    }

    result shouldBe "Meeting: early admissions, Start Time: 14:30, End Time: 15:30, Duration: 1 hour and 0 minutes, Date: October 15 2018, Participants: Kim R., Mike B., Paula P., Chin Z."
  }
})
