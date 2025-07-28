create index student_ids
on enrollments(student_id);

create index course_ids
on enrollments(course_id);

create index dept_number_semester
on courses(department, "number", semester);

create index titles
on courses(title);

create index satisfies_course
on satisfies(course_id);

create index satisfies_requirement
on satisfies(requirement_id);
