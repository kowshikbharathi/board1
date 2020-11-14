package com.ideas2it.health.schedule.Repositary;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ideas2it.health.schedule.Model.Schedule;

public interface ScheduleRepositary extends JpaRepository<Schedule, Integer> {

}
