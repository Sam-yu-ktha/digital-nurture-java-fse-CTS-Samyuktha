
-- Exercise 1 : User Upcoming Events   

SELECT u.full_name,
       e.title,
       e.city,
       e.event_date
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
JOIN Events e ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
  AND u.city = e.city
ORDER BY e.event_date;
   
-- Exercise 2 : Top Rated Events
   
SELECT e.title,
       AVG(f.rating) AS average_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(f.feedback_id) >= 10
ORDER BY average_rating DESC;

-- Exercise 3 : Inactive Users
   
SELECT u.user_id,
       u.full_name
FROM Users u
WHERE u.user_id NOT IN
(
    SELECT user_id
    FROM Registrations
    WHERE registration_date >= CURDATE() - INTERVAL 90 DAY
);
   
-- Exercise 4 : Peak Session Hours
   
SELECT e.title,
       COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.title;

-- Exercise 5 : Most Active Cities
   
SELECT u.city,
       COUNT(r.registration_id) AS total_registrations
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY total_registrations DESC
LIMIT 5;
   
-- Exercise 6 : Event Resource Summary
   
SELECT e.title,
       COUNT(CASE WHEN resource_type='pdf' THEN 1 END) AS pdf_count,
       COUNT(CASE WHEN resource_type='image' THEN 1 END) AS image_count,
       COUNT(CASE WHEN resource_type='link' THEN 1 END) AS link_count
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY e.title;

-- Exercise 7 : Low Feedback Alerts
   
SELECT u.full_name,
       e.title,
       f.rating,
       f.comments
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3;

-- Exercise 8 : Sessions Per Upcoming Event
   
SELECT e.title,
       COUNT(s.session_id) AS total_sessions
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.title;

-- Exercise 9 : Organizer Event Summary
   
SELECT organizer_id,
       status,
       COUNT(*) AS total_events
FROM Events
GROUP BY organizer_id, status;

-- Exercise 10 : Feedback Gap
   
SELECT e.event_id,
       e.title
FROM Events e
LEFT JOIN Feedback f
ON e.event_id = f.event_id
JOIN Registrations r
ON e.event_id = r.event_id
WHERE f.feedback_id IS NULL
GROUP BY e.event_id, e.title;
   
-- Exercise 11 : Daily New User Count
   
SELECT DATE(registration_date) AS registration_day,
       COUNT(*) AS total_users
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY DATE(registration_date)
ORDER BY registration_day;
   
-- Exercise 12 : Event With Maximum Sessions
   
SELECT e.title,
       COUNT(s.session_id) AS total_sessions
FROM Events e
JOIN Sessions s
ON e.event_id = s.event_id
GROUP BY e.event_id, e.title
ORDER BY total_sessions DESC
LIMIT 1;

-- Exercise 13 : Average Rating Per City
   
SELECT e.city,
       AVG(f.rating) AS average_rating
FROM Events e
JOIN Feedback f
ON e.event_id = f.event_id
GROUP BY e.city;

-- Exercise 14 : Most Registered Events
   
SELECT e.title,
       COUNT(r.registration_id) AS total_registrations
FROM Events e
JOIN Registrations r
ON e.event_id = r.event_id
GROUP BY e.title
ORDER BY total_registrations DESC
LIMIT 3;
   
-- Exercise 15 : Event Session Time Conflict   

SELECT s1.event_id,
       s1.session_id,
       s2.session_id
FROM Sessions s1
JOIN Sessions s2
ON s1.event_id = s2.event_id
AND s1.session_id < s2.session_id
AND s1.start_time < s2.end_time
AND s1.end_time > s2.start_time;
   
-- Exercise 16 : Unregistered Active Users
   
SELECT u.user_id,
       u.full_name
FROM Users u
LEFT JOIN Registrations r
ON u.user_id = r.user_id
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
AND r.registration_id IS NULL;

-- Exercise 17 : Multi Session Speakers

SELECT speaker_name,
       COUNT(*) AS total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;
   
-- Exercise 18 : Resource Availability Check

SELECT e.event_id,
       e.title
FROM Events e
LEFT JOIN Resources r
ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;
   
-- Exercise 19 : Completed Events With Feedback Summary
   
SELECT e.title,
       COUNT(DISTINCT r.registration_id) AS total_registrations,
       AVG(f.rating) AS average_rating
FROM Events e
LEFT JOIN Registrations r
ON e.event_id = r.event_id
LEFT JOIN Feedback f
ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id, e.title;
   
-- Exercise 20 : User Engagement Index

SELECT u.user_id,
       u.full_name,
       COUNT(DISTINCT r.event_id) AS attended_events,
       COUNT(DISTINCT f.feedback_id) AS feedback_submitted
FROM Users u
LEFT JOIN Registrations r
ON u.user_id = r.user_id
LEFT JOIN Feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name;

-- Exercise 21 : Top Feedback Providers

SELECT u.full_name,
       COUNT(f.feedback_id) AS feedback_count
FROM Users u
JOIN Feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name
ORDER BY feedback_count DESC
LIMIT 5;

-- Exercise 22 : Duplicate Registrations Check   

SELECT user_id,
       event_id,
       COUNT(*) AS duplicate_count
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;
   
-- Exercise 23 : Registration Trends    

SELECT DATE_FORMAT(registration_date,'%Y-%m') AS month,
       COUNT(*) AS total_registrations
FROM Registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY DATE_FORMAT(registration_date,'%Y-%m')
ORDER BY month;

-- Exercise 24 : Average Session Duration Per Event

SELECT e.title,
       AVG(TIMESTAMPDIFF(MINUTE,
                         s.start_time,
                         s.end_time))
       AS average_duration
FROM Events e
JOIN Sessions s
ON e.event_id = s.event_id
GROUP BY e.title;

-- Exercise 25 : Events Without Sessions

SELECT e.event_id,
       e.title
FROM Events e
LEFT JOIN Sessions s
ON e.event_id = s.event_id
WHERE s.session_id IS NULL;