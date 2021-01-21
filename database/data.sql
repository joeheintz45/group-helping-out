<<<<<<< HEAD
INSERT INTO "activity_type" ("activity_name")
VALUES ('Arts & Crafts'),
('Canvassing'),
('Cleaning'),
('Dog Walking'),
('Event Help'),
('Gardening'),
('Landscaping'),
('Litter Pickup'),
('Moving'),
('Other'),
('Packing'),
('Painting'),
('Reading'),
('Sorting');

INSERT INTO "ages" ("range")
VALUES ('0-4'),
('5-12'),
('13-17'),
('Adult'),
('Adult 55+'),
('Prefer not to say');

INSERT INTO "causes" ("cause")
VALUES ('Animals & Pets'),
('Arts & Music'),
('Children & Youth'),
('Colleges & Universities'),
('Domestic Violence'),
('Education & Literacy'),
('Environment'),
('Food & Nutrition'),
('Health & Substance Abuse'),
('Healthcare'),
('Homelessness & Housing'),
('Immigrants & Refugees'),
('Job Training & Employment'),
('Media & Journalism'),
('Re-entry & Criminal Justice'),
('Seniors & Caregivers'),
('Sports & Recreation');

INSERT INTO "access_level" ("title", "access_level")
VALUES ('Admin', 10),
('Organization', 20),
('Volunteer', 30);


-- one admin user, 1 volunteer user, 6 org users (5 set active to true, 1 set to false) USE encrypted PASS - it's shire
INSERT INTO "user" ("username", "password", "first_name", "last_name", "email_address", "phone_number", "company", "company_name", "volunteer", "active", "access_level_id") 
VALUES ('admin', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Leslie', 'Scott', 'leslie.scott@kairos.com', '(555)555-1234', true, 'Kairos', false, true, 1),
('brad', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Brad', 'Loudis', 'brad.loudis@email.com', '(555)555-2723', false, '', true, true, 3),
('gotrkc', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Victoria', 'Patrick', 'vpatrick@gotr.com', '(555)555-2753', true, 'Girls On The Run KC', false, true, 2),
('bgclub', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Mary', 'Elmer', 'kcadmin@boysandgirlsclub.com', '(555)555-4872', true, 'Boys and Girls Club of Kansas City', false, true, 2),
('kchabitat', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Tyler', 'Sandman', 'kchab@humanity.com', '(555)555-6412', true, 'Habitat for Humanity of Kansas City', false, true, 2),
('nourishkc', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Nathan', 'London', 'nathan@nourishkc.com', '(555)555-9210', true, 'Nourish KC', false, true, 2),
('kcanimals', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Erin', 'Haas', 'erin.haas@kcanimals.com', '(555)555-7832', true, 'KC Animal Shelter', false, false, 2),
('kcurban', '$2a$10$4mBT3./JmnTWb.7pNqS4XuRsBlgbdgXE.0RnDRJtqe38Le.3ddI7K', 'Andrew', 'Thomas', 'athomas@kcurban.com', '(555)555-5783', true, 'KC Urban C', false, true, 2);

-- add a few values for the 1 volunteer user
INSERT INTO "user_activity" ("user_id", "activity_type_id")
VALUES (2, 1),
(2, 3),
(2, 6),
(2, 8),
(2, 12);

-- add 1 value
INSERT INTO "user_ages" ("user_id", "ages_id")
VALUES (2, 4);

-- 6 orgs (one should be the user with active set to false)
INSERT INTO "organization" ("organization_name", "contact_title", "address", "mission", "summary", "website", "organization_type", "user_id", "logo")
VALUES ('Girls on the Run KC', 'Volunteer Coordinator', '211 W. 18th St, KC MO, 64108', 'We inspire girls to be joyful, healthy and confident using a fun, experience-based curriculum which creatively integrates running.', 'At Girls on the Run we inspire ALL girls to build confidence and make intentional decisions, while fostering care and compassion for self and others. Trained coaches use physical activity and dynamic discussions to build social, emotional and physical skills in every girl while encouraging healthy habits for life.', 'https://gotrkc.org', 'Non-profit', 3, 'https://kairos-images-bucket.s3.amazonaws.com/5430c23c-91e8-4ad7-a2d9-e04ff3b68ef2_gotrkc.png'),
('Boys & Girls Clubs of Greater Kansas City', 'Volunteer Admin', '4001 Blue Parkway Suite 102, KC MO, 64130', 'At Boys & Girls Clubs of Greater Kansas City, we turn dreams into realities. Befores into afters. Todays into tomorrows.', 'For more than 100 years, Boys & Girls Clubs of Greater Kansas City has been inspiring kids to live out their dreams through affordable, accessible opportunities in the urban core.', 'https://bgc-gkc.org/', 'Non-profit', 4, 'https://kairos-images-bucket.s3.amazonaws.com/0d88cb78-e496-4d24-b0cb-b4f172bc06a6_boysngirlskc.png'),
('Habitat for Humanity of Kansas City', 'PR Manager', '1423 E. Linwood Blvd., Kansas City, MO 64109', 'Everyone deserves decent, affordable shelter. Habitat for Humanity helps families in our Kansas City community build strength, stability, and self-reliance through shelter.', 'Since 1979 we have built or renovated more than 800 homes in Wyandotte, Leavenworth and Johnson counties in Kansas, and Clay, Platte and Jackson counties in Missouri. In addition to providing affordable housing, Habitat KC has helped thousands of families through our financial literacy and HOPE program.', 'https://habitatkc.org', 'Non-profit', 5, 'https://kairos-images-bucket.s3.amazonaws.com/6f7a0bb2-00d3-403e-a394-41e6a43affec_kchabitat.png'),
('Nourish KC', 'Volunteer Admin', 'P.O. Box 412458, KC MO, 64141', 'From FOOD INSECURITY to a FOOD SECURE Kansas City.', 'For more than 35 years, Nourish KC has been serving hot, nutritious meals to all who come with no questions asked and at no cost.', 'https://nourishkc.org/', 'Non-profit', 6, 'https://kairos-images-bucket.s3.amazonaws.com/aabf68a6-de3f-4d4c-b836-a841904f3c27_nourishkc.png'),
('KC Animal Shelter', 'Volunteer Manager', '1715 Main St, KC MO, 64108', 'To promote and provide the resources, education, and programs needed to eliminate the killing of companion animals.', 'KC Animal Shelter began when vulnerable, homeless pets truly needed us the most. When we were first imagined, Kansas City had a kill-rate of 87% – today, we have a save-rate of 97%. Through hardships, we have found inspiration; and through this inspiration, we have saved lives.', 'https://kcanimalshelter.org/', 'Non-profit', 7, 'https://kairos-images-bucket.s3.amazonaws.com/6bb85cbb-b3e9-4ba0-885b-ee77ec1fbd49_kcanimalshelter.png'),
('KC Urban C', 'Volunteer Coordinator', '721 N 31St St, KC KS, 66102', 'The mission of the Kansas City Urban Youth Center is to offer Christian hope, community, and wholeness to urban youth. We empower youth with resources to develop faith, character, knowledge and skills.', 'Kansas City Kansas After School Program for Kindergarten through 5th grade tutoring program focusing on Reading and Math skills.', 'https://kcurbanc.org/', 'Non-profit', 8, 'https://kairos-images-bucket.s3.amazonaws.com/1de7ad4c-b9cd-4f96-903f-95363e795c0d_kcurbanc.png');

-- 2-3 causes per org, but use best judgement 
INSERT INTO "org_causes" ("org_id", "cause_id")
VALUES (1, 3),
(1, 6),
(1, 7),
(1, 8),
(1, 17),
(2, 2),
(2, 3),
(2, 4),
(2, 6),
(2, 7),
(2, 8),
(3, 8),
(3, 9),
(3, 11),
(3, 12),
(3, 13),
(3, 15),
(3, 16),
(4, 1),
(4, 3),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 15),
(4, 16),
(5, 1),
(5, 3),
(5, 7),
(5, 8),
(5, 17),
(6, 2),
(6, 3),
(6, 4),
(6, 6),
(6, 13);



-- 15 is a good number to have
INSERT INTO "postings" ("org_id", "date_posted", "date_to_attend", "start_time", "end_time", "location", "title", "description", "repeating", "frequency", "people_needed", "active")
VALUES (1, '2020-12-20', '2021-01-25', '12:30', '4:30', '211 W. 18th St, KC MO, 64108', 'Girls On the Run 5K FUN RUN!', 'Be a Part of the Magic of a Girls on the Run 5K Each season ends with a celebratory 5K, where girls learn that everything they need to succeed is already within! As a volunteer, you can create an experience that girls in your community will never forget.', false, '', 12, true),
(2, '2021-01-04', '2021-02-10', '5:30', '10:30', 'the greater KC area', '25th Annual Kids Night Out', 'The 25th Annual Kids Night Out Event is an exciting evening where 1,200+ guests join together to benefit children served by Boys & Girls Clubs of Greater Kansas City. Help us deliver the supplies to the donors that are hosting events in their home!', false, '', 20, true),
(3, '2021-12-04', '2021-01-28', '6:00', '2:00', 'Westport, KC MO', 'Rock the Block', 'Habitat KC’s Rock The Block ™ event concentrates hundreds of volunteers on clusters of homes in strategic neighborhoods, making needed repairs of all sizes. The impact is striking but it’s more than just curb appeal that is restored. Rock The Block helps restore pride in homeownership for the affected families and helps increase community connections along the way.', false, '', 40, true),
(4, '2021-01-10', '2021-02-09', '8:00', '1:00', 'Greater Food Bank of KC', 'Food Donation Sorting', 'Nourish KC needs help! We want volunteers to help us organize food donations. Together, we can fight hunger in KC!', true, 'Once a week', 12, true),
(5, '2021-01-12', '2021-02-12', '12:30', '4:30', '1715 Main St, KC MO, 64108', 'Dog Walkers Needed!', 'Do you love dogs? KC Animal Shelter is looking for dog walkers to give our four legged friends some exercise.', true, 'Once a week', 6, true),
(6, '2021-01-02', '2021-01-25', '2:30', '4:30', 'Crossroads Academy', 'Math tutoring', 'We are looking for math tutors to help during after school hours at Crossroads Academy', true, 'Every day', 4, true),
(1, '2021-01-18', '2021-03-10', '6:15', '9:00', 'Olathe KS', 'End of season 5K race', 'Girls on the Run of KC is gearing up for our end of the season 5k! We need tons of volunteer power to make our 5k events a success, so we could really use your help! Being a 5k day volunteer is a fun and rewarding volunteer opportunity. We are looking for volunteers to help serve as Course Marshalls or a Bike Marshall! Bike Marshals will be used to lead and trail the race, as well as to supervise the safety of the course. Course marshals direct runners as they make their way along the course and make sure that runners follow the course correctly and safely. Timing wise, you will need to arrive at the Volunteer Tent at 6:15am and you will be finished around 9:00am.', false, '', 30, true),
(2, '2021-01-05', '2021-02-05', '10:00', '2:00', 'Country Club Plaza', 'Boys & Girls Club at the Country Club Plaza', 'When you volunteer at a Boys & Girls Club, you can make a difference in the lives of youth and give back to your community. Within the first few minutes of walking into a Club, you know you’re in a special place. Filled with the sounds and energy of spirited children and friendly, caring professionals, the Club is a fun and hopeful environment. Whether you help with homework, coach a game, or teach an art project, you’ll have the opportunity to build healthy relationships with young people eager for adult guidance, and have a positive impact on their lives. In turn, you will find that spending time with these young people has a positive impact on you as well.', false, '', 6, true),
(3, '2021-12-10', '2021-02-12', '12:30', '4:30', 'Jackson County', 'Get Building KC', 'By volunteering with your local Habitat for Humanity, you can be a part of the change you want to see in your community. We offer several opportunities to build or repair homes with families, in addition to volunteer work opportunities at your local Habitat ReStore. You can even invite your friends and family to join us.', false, '', 25, true),
(4, '2021-01-08', '2021-03-08', '12:30', '4:30', 'Union Station', 'Nourish KC at Union Station', 'It doesn’t take a big commitment to make a big impact. Together, with millions of other food bank volunteers, your time makes a difference in the lives of your neighbors struggling with hunger. Help the Feeding America nationwide network get food in the hands of those who need it most.', false, '', 30, true),
(5, '2021-12-10', '2021-02-15', '10:30', '4:30', 'KC Animal Shelter office', 'Dog Day Out', 'Our Dog Day Out program allows you to take a dog out of the shelter for outings in the community. Outings can include a hike, a car ride to get a pup cup, and visits to dog friendly stores and locations in Kansas City. Participants do not have to commit to a minimum number of outings or undergo the detailed training that in-shelter volunteers are required to take. Participants must be at least 18 years old.', false, '', 10, true),
(6, '2021-01-11', '2021-02-01', '12:30', '4:30', 'KC Urban C office park', 'Litter Pick Up', 'Together - we are keeping KC clean & beautiful. Come help us as we do our annual Spring Clean of our office park and surrounding neighborhood.', false, '', 50, true),
(1, '2021-12-20', '2021-01-30', '12:30', '4:30', 'Arrowhead Stadium', 'Fun Run at Arrowhead Stadium', 'We need volunteers to help us organize our fun run at the stadium. We need volunteers to serve as starters, course marshalls, supporting the aid stations, and people to help with check in', false, '', 50, true),
(2, '2021-01-04', '2021-01-24', '12:30', '4:30', 'Boys and Girls Club KC offices', 'Boys and Girls Club mentorship program', 'We are looking for new mentors for our mentor-student program. Mentoring provides youth with mentors who can develop an emotional bond with the mentee, have greater experience than the mentee, and can provide support, guidance, and opportunities to help youth succeed in life and meet their goals.', true, 'Once a week', 20, true),
(5, '2021-12-20', '2021-03-12', '9:00', '2:00', 'KC Animal Shelter office', 'Adopt a pet event', 'March 12th is our first big adoption event of the new year. We are looking for volunteers to help us set up for the event and during the event.', false, '', 5, true);


-- up to 15 "posting_id" ... vary the "activity_type_id"
INSERT INTO "posting_activity" ("posting_id", "activity_type_id")
VALUES (1, 1),
(1, 5),
(1, 10),
(2, 3),
(2, 5),
(2, 10),
(3, 1),
(3, 3),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 11),
(3, 12),
(4, 5),
(4, 10),
(4, 11),
(4, 14),
(5, 4),
(5, 9),
(5, 10),
(6, 10),
(6, 13),
(7, 1),
(7, 5),
(7, 10),
(8, 1),
(8, 2),
(8, 3),
(8, 5),
(8, 7),
(8, 8),
(8, 12),
(8, 14),
(9, 1),
(9, 3),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 11),
(9, 12),
(10, 1),
(10, 3),
(10, 5),
(10, 14),
(11, 1),
(11, 3),
(11, 4),
(11, 5),
(11, 10),
(12, 3),
(12, 5),
(12, 10),
(12, 14),
(13, 1),
(13, 3),
(13, 5),
(13, 10),
(14, 10),
(14, 13),
(15, 4),
(15, 5),
(15, 14);



-- up to 15 "posting_id"
INSERT INTO "posting_ages" ("posting_id", "ages_id")
VALUES (1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 3),
(2, 4),
(2, 5),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 3),
(4, 4),
(4, 5),
(5, 3),
(5, 4),
(5, 5),
(6, 4),
(6, 5),
(6, 6),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(8, 3),
(8, 4),
(8, 6),
(9, 3),
(9, 4),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(14, 2),
(14, 4),
(15, 2),
(15, 3),
(15, 4);

-- adds an upcoming event to brad's profile page
INSERT INTO "posting_volunteers" ("posting_id", "user_id", "waiver_agreement")
VALUES (7, 2, true);
=======
>>>>>>> d2e693511a829d79b76919b1a638040787872045
