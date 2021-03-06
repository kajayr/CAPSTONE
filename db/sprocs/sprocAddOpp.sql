DELIMITER $$
CREATE DEFINER=`eLeapisit`@`%` PROCEDURE `sprocAddOpp`(
in agencyCommitment_v varchar(45),
in applicationDueDate_v varchar(45),
in classID_v int,
in classType_v varchar(45),
in classYear_v varchar(45),
in courseSummary_v varchar(45),
in createDate_v datetime,
in deliverables_v varchar(45),
in description_v varchar(45),
in donation_v smallint, 
in duration_v int,
in endDate_v datetime,
in estimatedClassSize_v varchar(45),
in examples_v varchar(45),
in hoursRequired_v varchar(45),
in isClass_v tinyint(1),
in isRequiredForClass_v varchar(45),
in isPaid_v tinyint,
in isServiceLearning_v tinyint,
in isTeams_v tinyint(1),
in isVirtual_v tinyint,
in latitude_v varchar(45),
in location_v varchar(45),
in longitude_v varchar(45),
in minimumPersonRequired_v varchar(45),
in notAllowed_v varchar(45),
in notes_v varchar(45),
in numberOfTeams_v varchar(45),
in onBoarding_v varchar(45),
in opportunityType_v varchar(45),
in ownerID_v int,
in pay_v smallint,
in preferedAgencyType_v varchar(45),
in preferedServiceWorkType_v varchar(45),
in recurrence_v varchar(45),
in requirements_v varchar(45),
in startDate_v datetime,
in statusID_v int,
in supportDescription_v varchar(45),
in supportPreference_v varchar(45),
in teamSize_v varchar(45),
in term_v varchar(45),
in timePeriodEnd_v datetime,
in timePeriodStart_v datetime,
in title_v varchar(45),
in totalSeats_v int
)
BEGIN
	DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;
	START TRANSACTION;
	INSERT INTO eLeapData.opportunityTable(
    title,
	description,
	startDateTime,
	endDateTime,
	createDate,
	classID,
	totalSeats,
	ownerID,
	statusID,
	notes,
	pay,
	donation,
	isPaid,
	isServiceLearning,
	recurrence,
	isVirtual,
	duration,
	timePeriodStartDate,
	timePeriodEndDate,
	location,
	longitude,
	latitude,
	isClass,
	classType,
	term,
	classYear,
	applicationDueDate,
	courseSummary,
	estimatedClassSize,
	isRequiredForClass,
	opportunityType,
	supportPreference,
	onBoarding,
	minimumPersonRequired,
	isTeams,
	teamSize,
	hoursRequired,
	preferedServiceWorkType,
	preferedAgencyType,
	numberOfTeams,
	examples,
	deliverables,
	agencyCommitment,
	notAllowed,
	requirements,
	supportDescription)
	values
	(title_v,
	description_v,
	startDate_v,
	endDate_v,
	createDate_v,
	classID_v,
	totalSeats_v,
	ownerID_v,
	statusID_v,
	notes_v,
	pay_v,
	donation_v,
	isPaid_v,
	isServiceLearning_v,
	recurrence_v,
	isVirtual_v,
	duration_v,
	timePeriodStart_v,
	timePeriodEnd_v,
	location_v,
	longitude_v,
	latitude_v,
    isClass_v,
	classType_v,
	term_v,
	classYear_v,
	applicationDueDate_v,
	courseSummary_v,
	estimatedClassSize_v,
	isRequiredForClass_v,
	opportunityType_v,
	supportPreference_v,
	onBoarding_v,
	minimumPersonRequired_v,
	isTeams_v,
	teamSize_v,
	hoursRequired_v,
	preferedServiceWorkType_v,
	preferedAgencyType_v,
	numberOfTeams_v,
	examples_v,
	deliverables_v,
	agencyCommitment_v,
	notAllowed_v,
	requirements_v,
	supportDescription_v
    );
    COMMIT;
SELECT * from eLeapData.opportunityTable Where eLeapData.opportunityTable.opportunityId =LAST_INSERT_ID();
END$$
DELIMITER ;
