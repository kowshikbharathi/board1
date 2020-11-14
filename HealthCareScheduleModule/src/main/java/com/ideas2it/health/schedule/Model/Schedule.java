package com.ideas2it.health.schedule.Model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "schedule_tbl")
public class Schedule {

	@Id
	@Column(name = "schedule_id")
	private long scheduleid;

	@Column(name = "patient_id")
	private long patientid;

	@Column(name = "schedule_date")
	private Date scheduleDate;

	@Column(name = "next_schedule_date")
	private Date nextScheduleDate;

	@Column(name = "schedule_doctor_id")
	private long scheduledDoctorId;

}
