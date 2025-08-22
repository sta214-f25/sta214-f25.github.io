---
layout: page
title: Syllabus
description: >-
    Course policies and information.
---

# Syllabus
{:.no_toc}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

*Note: this syllabus may change in response to changing public health circumstances or university protocols.*

## Overview

Welcome to STA 214! This course covers *generalized linear models* (GLMs), which generalize the regression models we learned in STA 112 to other types of response variables. We will cover logistic regression, multinomial regression, and Poisson regression. We will also discuss random effects, which allow us to handle patterns of dependence in our data. Throughout the semester you will work with real data from a variety of sources, and we will emphasize reproducibility, checking assumptions, and thoughtful data analysis.

**Time:** MWF 11:00 -- 11:50

**Location:** Carswell 101

**Professor:** Ciaran Evans

**Office:** Manchester 329

**Email:** evansc@wfu.edu *(please allow 24 hours for email responses, and longer on weekends)*

## Learning outcomes

By the end of this course, you will be able to:

* Choose an appropriate statistical method to model the relationship between a binary, count, or continuous response variable and one or more explanatory variables; justify why the chosen method is appropriate; fit the model using statistical software; and report and interpret the results
* Assess the model assumptions and performance for a fitted model, using tools such as empirical logit plots, quantile residual plots, variance inflation factors, and goodness-of-fit statistics; and adjust the model with appropriate modifications as needed
* Choose appropriate random effects to account for dependence in observations, and interpret the meaning of these random effects and of the fixed effects in a mixed-effects model in context of the original data and research question
* Identify appropriate inference procedures to answer research questions about the relationships between variables, perform these inference procedures with fitted models, and interpret the results in the context of the original data and research question
* Apply statistical modeling and inference tools to real data to answer research questions, and communicate the results in a written report
* Explain how choosing an incorrect distribution for the response variable when building a model, or failing to account for dependence, can negatively impact the results of a data analysis

## Course materials

**Laptops:** You will need a laptop for this class, and must bring it every day.

**Textbook:** [Beyond MLR](https://bookdown.org/roback/bookdown-BeyondMLR/): Beyond Multiple Linear Regression, Roback and Legler. The textbook is available, *free*, at the link provided.

**Software:** We will be using the statistical software [R](https://cran.r-project.org/), through the interface [RStudio](https://posit.co/download/rstudio-desktop/) for working with data and statistical modeling. You will need to download R and RStudio onto your laptop; instruction will be provided on the course website.

## Getting help

If you have any questions about the course (or statistics in general!), please don't hesitate to ask! I am available during office hours, by appointment, or via email. If you're emailing about a coding issue, please include a minimum working example (everything I need to reproduce the issue you encountered). 

Keep in mind that debugging software issues can take time, so make sure to start the assignments early in case you run into problems.

**Office hours:** Drop-in office hours will be held in Manchester 329 at the following times: (TBA)


## Course policies

### Communication

While course materials will be posted on the course website, I will send messages and announcements through Canvas. Please make sure your Canvas account is set up so that you receive emails when I send these messages.

### Participation and illness

Attendance is important, and you are expected to participate actively in class activities and discussions during lecture. However, your health, and the health of your peers, is crucial. If you are ill, please do not come to class or office hours. All class materials will be posted online, and I can meet with you one-on-one when you have recovered. If you need office hours when you are ill, I am happy to communicate via email or Zoom. Extensions on coursework may be granted on an individual basis under extenuating circumstances.

### Extensions

You have a bank of **5** extension days, which you may use over the course of the semester. You may use either 1 or 2 extension days for a give homework or project (making the assignment due either 24 or 48 hours after the original due date). If you plan to use an extension, you must email me before the assignment is due.

Extensions in extenuating circumstances, such as family emergencies, will be handled separately and on an individual basis.

### Accessibility

If you require accommodations due to a disability or other learning differences, contact the Center for Learning, Access, and Student Success  at 336-758-5929 or class@wfu.edu as soon as possible to better ensure that such accommodations are implemented in a timely fashion. Please feel free to contact me, and I will be happy to discuss any necessary accommodations. I always like to know how to help my students feel comfortable and successful in our course.

**Scent-free zone:** The 3rd floor of Manchester is a scent-free zone. Please refrain from wearing perfume, cologne, scented lotion, body spray, and all other scented products if visiting the third floor.

### Mental health

All of us benefit from support during times of struggle. You are not alone. There are many helpful
resources available on campus and an important part of the college experience is learning how to ask
for help. Asking for support sooner rather than later is often helpful.

If you or anyone you know experiences any academic stress, difficult life events, or feelings like anxiety or depression, we strongly encourage you to seek support. The University Counseling Center is here to help: call 336-758-5273 or visit their website at [https://counselingcenter.wfu.edu/](https://counselingcenter.wfu.edu/).

If you or someone you know is feeling suicidal or in danger of self-harm, call someone immediately, day or night: 
Counseling Center: 336-758-5273

If the situation is life threatening, call the police: 
911 or 336-758-5911 (campus police)


### AI policy, use of outside resources, and collaboration

Statistics, coding, and data science do not exist in a vacuum, and practicing statisticians and data scientists rarely find themselves in a situation in which it is impossible to use any outside resources. Unless otherwise stated, on **homework assignments** and **class activities** you are therefore free (and encouraged!) to:

* use AI tools (e.g. ChatGPT, Gemini, Claude, etc.)
* use online resources such as freely available textbooks (both those for our class and others you find helpful), vignettes, lecture notes, and examples
* use online resources for sharing code, such as StackOverflow
* collaborate with other students

However, please be cautious and avoid over-reliance on these resources. Your use of these resources should *assist* your own work, not *replace* it. In STA 214, any homework you are given is designed to help you practice and learn the material, as well as to prepare you for exams. You will do a disservice to your preparation for future study and employment, as well as to your own exam grades, if you rely too heavily on AI or on others.

Here are a few examples of *good* questions you might ask Google, an AI tool, or a classmate:

* "What does this error message mean?"
* "What input types does this function accept?"
* "For what type of variables is Poisson regression suitable?"
* "What is an example of zero inflation?"
* "Explain what this chunk of code is doing"

And here are a few examples of questions you should generally avoid:

* "Write a solution to this homework problem"
* "Fix this code"

**Class rules for AI, outside resources, and collaboration:**

* These resources may be used, unless otherwise stated, on homework and class activities
* These resources may *not* be used on exams
* Rules for projects will be specified in the project descriptions
* If you have obtained help from the internet or an AI tool, you must **explicitly cite** where you have obtained the help. Any reused code that is not explicitly cited will be treated as plagiarism and may result in a grade of 0. Directly copying discussion, interpretation, or mathematical derivations will also be treated as plagiarism and may result in a grade of 0.
    * If the help was obtained from a site like StackOverflow, provide a URL to the post
    * If the help was was obtained from an AI tool, provide the name of the tool and the queries you used
* While you are encouraged to collaborate with other students on homework assignments, you may not copy code and/or answers directly from another student. If your solution was written with help from another student, acknowledge your collaborator(s) at the top of the assignment. Failure to acknowledge collaborators will be treated as plagiarism and may result in a grade of 0. If you copy someone else's work, both parties may receive a grade of 0.
* Rather than copying someone else's work, ask for help. You are not alone in this course!

### Academic integrity

I expect and require that students conduct themselves in a manner according to the Wake Forest standard for academic integrity. Cheating or academic dishonesty of any kind will not be tolerated. For other information on these matters, please consult the [Code of Conduct](https://studentconduct.wfu.edu/). For Academic issues please see the [College Judicial System](https://studentconduct.wfu.edu/the-judicial-council/).

### Professionalism

Laptops will be used regularly in class, and you must bring one each day. You may also use laptops or tablets to take notes. Please refrain from using your cellphone, laptop, or tablet for anything other than coursework during class. 

## Course components

### Class participation

In general, I expect you to come to class and participate in the lecture and activities. Your class participation grade will consist of class activities and attendance at departmental seminars.


**Class activities:** This course includes regular, short activities during class time to help your learning. Participation in class activities is expected, and you will submit your work on these activities at the end of class. Most class periods will have at least one activity; some class periods will have multiple activities. Class activities will be graded for effort, not for completeness or correctness.

If you are unable to attend class due to illness or extenuating circumstances, please let me know. Class activities may be made up at a later date at the instructor's discretion. Persistent absences, however, will not be permitted except in special circumstances such as a medical or family emergency.


**Department seminars:** Throughout the semester, the department will host visiting speakers who will give talks on a range of statistical topics. You will attend these seminars and submit a short (one or two paragraph) reflection on the talk and how it relates to material you have learned in your statistics courses. If you cannot attend the seminars due to a conflict, I will provide alternative talks available on YouTube. If you are simultaneously enrolled in another of my courses, the same seminar attendance and reflection may count for both courses.

Reflections on department seminars will be due the day after the seminar (except in extenuating circumstances). Note: it is ok if you don't understand everything in a seminar talk! The goal is to be exposed to a broad range of topics in statistics and data science, and make connections with material you have seen in your statistics courses.

**Seminar dates:** (additional seminars may be added later)

* September 11 (11am): Robert Langefeld
* September 30 (11am): Michael Hudgens
* October 7 (11am): Nate Josephs
* October 28 (11am): Fan Li
* November 11 (11am): Jessica Hullman

### Homework

Homework will be assigned most weeks, and will be posted on the course website. 

You are welcomed, and encouraged, to work with each other on homework assignments, but you must turn in your own work. If you copy someone else’s work, both parties may receive a 0 for the assignment grade, and may be reported to the honor council. If you work with someone else, you must write the name of your collaborator(s) on your homework.

Submission instructions and due dates will be provided on each assignment. Grading will be based on both completeness and accuracy. 


### Project

Statistics and data science in the real world often involves working with complex datasets to answer one or more high-level research questions, and communicating these results to a wider audience. Projects provide an opportunity to develop these skills, and apply the tools you have learned in class and practiced on homework assignments.

There will be one project in this course. Further instructions and grading information will be provided in the project description.

### Exams

We will have two in-class exams and one final exam.

**Exam 1:** October 10 (tentative), in class

**Exam 2:** November 21 (tentative), in class

**Final exam:** December 13, 2pm


## Grading

| Component | Weight |
| --------- | ------ |
| Participation | 5% |
| Homework |  15%   |
| Midterm exam 1    |  15%   |
| Midterm exam 2 | 15% |
| Project | 25% |
| Final exam | 25% |

I will use the standard grading scale (above a 93 is an A, above a 90 is an A-, above an 87 is a B+, etc.)

### Late work

* 30 minutes -- 24 hours late (after extensions): lose 20% of points
* 24 -- 48 hours late (after extensions): lose 40% of points.
* more than 48 hours late (after extensions): no credit

If you know you cannot turn in assignment (for instance, if you are ill or there is a family emergency), let me know before the assignment is due, and we will work something out. There will be no grade changes after our last day of class.

### Regrade requests

If you believe an error has been made in grading your work, you must email me within one week of receiving the graded homework, exam, or project.
