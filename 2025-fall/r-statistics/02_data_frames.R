students <- data.frame(
  id = 1:8,
  gender = c("F", "M", "F", "M", "M", "F", "F", "M"),
  dept = c("stat", "math", "stat", "stat", "math", "econ", "econ", "stat"),
  midterm = c(65, 48, 82, 71, 55, 90, 38, 77),
  final = c(70, 52, 88, 60, 45, 95, 50, 81)
)

students$avg <- with(students, 0.4 * midterm + 0.6 * final)
students$passed <- students$avg >= 60

head(students, 3)
nrow(students)
summary(students$avg)

students[order(-students$avg), c("id", "dept", "avg")]
subset(students, dept == "stat" & avg > 60, select = c(id, avg))

aggregate(avg ~ dept, data = students, FUN = mean)
aggregate(cbind(midterm, final) ~ gender, data = students, FUN = median)
tapply(students$avg, students$dept, sd)
table(students$dept, students$passed)

info <- data.frame(dept = c("stat", "math", "econ"), faculty = c("Science", "Science", "Economics"))
merged <- merge(students, info, by = "dept")
merged[, c("id", "dept", "faculty")]

students <- transform(students, grade = cut(avg, breaks = c(0, 50, 60, 70, 85, 100),
                                            labels = c("FF", "DD", "CC", "BB", "AA")))
table(students$grade)

new_student <- data.frame(id = 9, gender = "F", dept = "math", midterm = 60, final = 72,
                          avg = 67.2, passed = TRUE, grade = "CC")
students <- rbind(students, new_student)
tail(students, 2)

split_by_dept <- split(students$avg, students$dept)
sapply(split_by_dept, range)

students$z <- round(scale(students$avg)[, 1], 2)
students[abs(students$z) > 1, c("id", "avg", "z")]
