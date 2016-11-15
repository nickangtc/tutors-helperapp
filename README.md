# Tutor's helper

Tutor's helper is a full stack web platform for personal tutors to coordinate classes with their students. It's designed to take the chore out of payment management, class bookings, giving feedback and more. A lightweight forum is also included for students to interact with one another.

In short, Tutor's helper is a CRM for personal tutors.

Note: This is version 0.1 and many aspects have not yet been tested for reliability. Use in an actual tutor-student setting is discouraged for now.

![tutor's helper demo gif](http://i.giphy.com/l2JhMwxOduNqgVZsc.gif)

## Features

Here's the current list of stable features:
* Calendar to view, add and edit classes, and to set unavailable dates
* An overview page for a quick glance of things to do (finances to come)
* Forum for students and tutor to post questions and discuss
* Give feedback to student after every class

## Technology stack

As of version 0.1, Tutor's helper is built on Ruby on Rails and Postgres DB, with Semantic UI as the chosen front-end library.

![ruby on rails logo](http://logos-download.com/wp-content/uploads/2016/09/Ruby_on_Rails_logo_small.png)
![postgres sql logo](https://raw.githubusercontent.com/docker-library/docs/01c12653951b2fe592c1f93a13b4e289ada0e3a1/postgres/logo.png)
![semantic ui logo](https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2016/04/1461315888semantic.png)

## Development process

This was my final General Assembly project. In the span of a week we were tasked to build a project that would be the culmination of what we've learned over the 3 month course.

I chose to build this because it required knowledge of several tech/topics that I felt were valuable as a fledgling web developer:
* Setting up Rails model-view-controller
* Making AJAX calls in Rails to improve UX by reducing browser refreshes
* Using Rails gems like [Simple_Calendar](https://github.com/excid3/simple_calendar) and [Devise](https://github.com/plataformatec/devise) (authentication)
* Writing embedded Ruby using [Haml](https://github.com/haml/haml), a superior templating language (IMHO) to .erb
* Integrating Rails with a front-end library like Semantic UI
* Tying the pieces together in Rails to build a full stack web app

Building this app was the most fun I had in the entire course at General Assembly because I knew what I was doing most of the time. It was the first time I've experienced self-efficacy as a programmer. Whenever I was stuck, I knew where to look for answers. (Mostly the official docs and Stack Overflow.)

Technically speaking, this isn't pushing the limits of sophistication. The point, for me at least, wasn't to make use of _all_ the things I've learned. It was to challenge myself to build something interesting, potentially useful, and more importantly, to push myself to build something that _someone would actually use_. That meant it had to have good enough functionality and a decent UX.

The goal was to build a solid foundation for the project, and then build some more on top of that afterwards. I didn't want to have to overhaul the project when I came back to it because of spaghetti code and bad database architecture. I'm happy to report that at this point, I don't feel stressed out looking at the code. Fingers crossed!
